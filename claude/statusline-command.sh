#!/usr/bin/env bash
# Claude Code status line — shows context usage prominently
input=$(cat)

# Context window
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
used_tokens=$(echo "$input" | jq -r '.context_window.used_tokens // empty')

# Model
model=$(echo "$input" | jq -r '.model.display_name // empty')

# CWD basename from JSON (agent bash resets cwd, so use the JSON value)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
cwd_base=$(basename "$cwd")

# Git branch (skip optional locks; gracefully empty if not a repo)
branch=""
if [ -n "$cwd" ] && git -C "$cwd" --no-optional-locks rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
fi

# Rate limits (optional — only present after first API call for subscribers)
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Format seconds-remaining as compact human string: "1d4h", "3h22m", "47m", "<1m"
fmt_remaining() {
  local secs=$1
  if [ "$secs" -le 0 ]; then echo "0m"; return; fi
  local d=$((secs / 86400))
  local h=$(((secs % 86400) / 3600))
  local m=$(((secs % 3600) / 60))
  if [ "$d" -gt 0 ]; then
    printf '%dd%dh' "$d" "$h"
  elif [ "$h" -gt 0 ]; then
    printf '%dh%02dm' "$h" "$m"
  elif [ "$m" -gt 0 ]; then
    printf '%dm' "$m"
  else
    printf '<1m'
  fi
}

now=$(date +%s)

# Build output
parts=()

# Context — usage % + token count
if [ -n "$used" ] && [ -n "$used_tokens" ]; then
  tok_k=$(echo "$used_tokens" | awk '{printf "%.0fk", $1/1000}')
  parts+=("$(printf '\033[1mctx:\033[0m %.0f%% (%s)' "$used" "$tok_k")")
elif [ -n "$used" ]; then
  parts+=("$(printf '\033[1mctx:\033[0m %.0f%%' "$used")")
fi

# Model
[ -n "$model" ] && parts+=("$model")

# Directory + branch
if [ -n "$branch" ]; then
  parts+=("$cwd_base ($branch)")
elif [ -n "$cwd_base" ]; then
  parts+=("$cwd_base")
fi

# Rate limits — show actual remaining time until reset, not the static window name
rate_parts=()
if [ -n "$five_pct" ]; then
  if [ -n "$five_reset" ]; then
    rate_parts+=("$(printf '%s:%.0f%%' "$(fmt_remaining $((five_reset - now)))" "$five_pct")")
  else
    rate_parts+=("$(printf '5h:%.0f%%' "$five_pct")")
  fi
fi
if [ -n "$week_pct" ]; then
  if [ -n "$week_reset" ]; then
    rate_parts+=("$(printf '%s:%.0f%%' "$(fmt_remaining $((week_reset - now)))" "$week_pct")")
  else
    rate_parts+=("$(printf '7d:%.0f%%' "$week_pct")")
  fi
fi
[ ${#rate_parts[@]} -gt 0 ] && parts+=("${rate_parts[*]}")

# Join with separator
printf '%s' "$(IFS=' | '; echo "${parts[*]}")"
