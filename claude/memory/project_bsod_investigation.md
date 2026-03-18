---
name: BSOD investigation SRBM016 (ongoing)
description: Windows host SRBM016 — 5 BSODs across 2026-03-17/18. Defender platform KB4052623 v4.18.26010.5 is broken (engine 0.0.0.0), causing 0x3B and likely cascading 0x19C crashes
type: project
---

## BSOD Investigation — SRBM016.cardpay.local

### Day 1: 2026-03-17 — 3x `0x3B SYSTEM_SERVICE_EXCEPTION`

- 3 consecutive BSODs between 15:16–15:41
- Exception `0xC0000005` (access violation), faulting offset `0x56be` (identical all 3)
- Prime suspect: `KslD.sys` (Defender Malware Protection driver, v1.1.25111.3024)
- KB4052623 (Defender platform v4.18.26010.5) completed installing at 15:42:18
- Dumps: `031726-21843-01.dmp`, `031726-22828-01.dmp`, `031726-24031-01.dmp`, `031726-23000-01.dmp`

### Day 2: 2026-03-18 — 2x `0x19C WIN32K_CRITICAL_FAILURE`

- Crash 1: ~14:08:41, rebooted 14:31. Dump: `031826-20937-01.dmp`
- Crash 2: ~19:14:00, rebooted 19:30. Dump: `031826-21546-01.dmp`
- Parameter 1: `0x50` — identical both crashes (same root cause)
- First crash occurred shortly after wake from Modern Standby

### Defender is completely broken

- Overnight (01:39 AM): engine crashed with `0xC0000420` (STATUS_ASSERTION_FAILURE) in `KERNELBASE.dll`
- Service hung 240s during shutdown, forcibly disabled at 03:23 AM (`DisableServiceForcibly`)
- Current state: engine `0.0.0.0`, service `0.0.0.0`, no signatures loaded — zombie state
- Platform version still `4.18.26010.5`

### Environment

- Windows 11 25H2, build 26200.8037
- Kernel patches: KB5079473 + KB5083532 (2026-03-11)
- CrowdStrike Falcon (`csagent.sys` v20505), Cisco AnyConnect (`acsock64.sys`)

### Next steps

1. `MpCmdRun.exe -RevertPlatform` (elevated) to roll back Defender
2. If that fails: `wusa /uninstall /kb:4052623`
3. Run WinDbg `!analyze -v` on `031826-*.dmp` (needs admin for Minidump folder)
4. If crashes continue post-Defender fix: uninstall KB5079473/KB5083532
5. Check if fleet-wide across cardpay.local
