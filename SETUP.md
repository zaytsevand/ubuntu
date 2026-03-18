# Andrei Zaitsev — WSL Dev Environment Setup

Machine: SRBM016 (WSL2, Ubuntu)

## What's Inside

### shell/
- `.zshrc` — Oh My Zsh with robbyrussell theme, custom prompt (hostname icon, truncated git branch, venv indicator), plugins: git, fzf, pip, sudo, zsh-interactive-cd, docker, docker-compose, z, zsh-syntax-highlighting, jenv, direnv, nvm
- `.zprofile` — pipx PATH
- `.bashrc` / `.profile` — defaults with standard aliases

### git/
- `.gitconfig` — user: Andrei Zaitsev <a.zaitsev@unlimit.com>, push.autoSetupRemote=true

### java/
- `.docker-java.properties` — API version 1.44
- `.testcontainers.properties` — UnixSocketClientProviderStrategy

### gradle/
- `gradle.properties` — JAVA_HOME → ms-21.0.9
- `gradle.16.properties` — JAVA_HOME → semeru-16.0.2
- `gradle.21.properties` — JAVA_HOME → ms-21.0.9

### claude/
- `CLAUDE.md` — global Claude Code rules (GitLab host, git workflow, banking architecture conventions, MR review approach)
- `settings.json` — permissions, allowed domains, MCP tools
- `skills/` — 13 custom skills (create-mr, git-commit, review, jira, daily reports, sprint review, etc.)
- `memory/` — persistent memory files
- `projects/project-list.txt` — list of per-project Claude configs

### config/glab-cli/
- `config.yml` — glab CLI config for gitlab.cardpay-test.com (token placeholder)

### architecture/
- Banking platform service index, dependency diagram, description template, AI docs manual

### gpg/
- `unlimit_gpg_public.asc` — GPG public key

### oh-my-zsh-custom-plugins/
- `plugins.txt` — list of custom plugins to `git clone` into `~/.oh-my-zsh/custom/plugins/`:
  - `autoswitch_virtualenv`
  - `zsh-syntax-highlighting`

## Restore Steps

1. Copy `shell/*` to `~/`
2. Copy `git/.gitconfig` to `~/`
3. Copy `java/*` to `~/`
4. Copy `gradle/*` to `~/.gradle/`
5. Copy `claude/CLAUDE.md` and `claude/settings.json` to `~/.claude/`
6. Copy `claude/skills/*` to `~/.claude/skills/`
7. Copy `config/glab-cli/*` to `~/.config/glab-cli/`
8. Install oh-my-zsh, then clone custom plugins from `plugins.txt`
9. Install: jenv, nvm (lts/*), direnv, pipx (poetry, virtualenv), fzf
10. Set up JDKs in `~/.jdks/` (ms-21.0.9, semeru-16.0.2)
11. Replace `<YOUR_GITLAB_TOKEN>` in `.zshrc` and `glab-cli/config.yml`
12. Import GPG key: `gpg --import gpg/unlimit_gpg_public.asc`

## NOT included (secrets / ephemeral)
- `~/.ssh/` — regenerate keys on new machine
- `~/.gnupg/` private keys — export separately
- `~/.zsh_history` / `.bash_history`
- `~/.gradle/caches/`, `~/.m2/repository/` — rebuilt automatically
- GitLab tokens — replaced with placeholders
