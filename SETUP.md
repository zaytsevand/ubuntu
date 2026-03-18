# WSL Dev Environment Setup

## What's Inside

### shell/
- `.zshrc` — Oh My Zsh with robbyrussell theme, custom prompt (truncated git branch, venv indicator), plugins: git, fzf, pip, sudo, zsh-interactive-cd, docker, docker-compose, z, zsh-syntax-highlighting, jenv, direnv, nvm
- `.zprofile` — pipx PATH
- `.bashrc` / `.profile` — defaults with standard aliases

### git/
- `.gitconfig` — push.autoSetupRemote=true (fill in your name/email)

### java/
- `.docker-java.properties` — API version 1.44
- `.testcontainers.properties` — UnixSocketClientProviderStrategy

### gradle/
- `gradle.properties` — JAVA_HOME → ms-21.0.9
- `gradle.16.properties` — JAVA_HOME → semeru-16.0.2
- `gradle.21.properties` — JAVA_HOME → ms-21.0.9

### claude/
- `CLAUDE.md` — global Claude Code rules (GitLab workflow, MR review approach)
- `settings.json` — permissions and MCP tools
- `skills/` — custom skills (create-mr, git-commit, review, jira, daily standup, sprint review, etc.)
- `memory/` — persistent memory files

### config/glab-cli/
- `config.yml` — glab CLI config (add your GitLab host and token)

### oh-my-zsh-custom-plugins/
- `plugins.txt` — list of custom plugins to `git clone` into `~/.oh-my-zsh/custom/plugins/`:
  - `autoswitch_virtualenv`
  - `zsh-syntax-highlighting`

## Restore Steps

1. Run `zsh.sh` to install zsh, oh-my-zsh, plugins, and deploy `.zshrc`
2. Copy `git/.gitconfig` to `~/` and fill in your name/email
3. Copy `java/*` to `~/`
4. Copy `gradle/*` to `~/.gradle/`
5. Copy `claude/CLAUDE.md` and `claude/settings.json` to `~/.claude/`
6. Copy `claude/skills/*` to `~/.claude/skills/`
7. Copy `config/glab-cli/*` to `~/.config/glab-cli/` and add your GitLab host/token
8. Set up JDKs in `~/.jdks/` (ms-21.0.9, semeru-16.0.2)
9. Update placeholders: `<YOUR_GITLAB_HOST>`, `<YOUR_JIRA_URL>`, `<YOUR_NAME>`, `<YOUR_EMAIL>`

## NOT included (secrets / ephemeral)
- `~/.ssh/` — regenerate keys on new machine
- `~/.gnupg/` — export/import separately
- `~/.zsh_history` / `.bash_history`
- `~/.gradle/caches/`, `~/.m2/repository/` — rebuilt automatically
- Tokens — replaced with placeholders
