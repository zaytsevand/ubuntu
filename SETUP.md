# WSL Dev Environment Setup

## What's Inside

### shell/
- `.zshrc` — Oh My Zsh with robbyrussell theme, custom prompt (truncated git branch, venv indicator), plugins: git, fzf, pip, sudo, zsh-interactive-cd, docker, docker-compose, z, zsh-syntax-highlighting, direnv, nvm
- `.zprofile` — pipx PATH
- `.bashrc` / `.profile` — defaults with standard aliases

### git/
- `.gitconfig` — push.autoSetupRemote=true (fill in your name/email)

### claude/
- `CLAUDE.md` — global Claude Code rules (GitLab workflow, MR review approach)
- `settings.json` — permissions and MCP tools
- `skills/` — vendored copies of chorus-*, coryphaeus, problem-brief; `VENDORED.md` has the pinned commits, `sync-skills.sh` refreshes them
- `INVENTORY.md` — installed plugins, skills, subagents, mods and MCP servers (with usage counts)

### config/glab-cli/
- `config.yml` — glab CLI config (add your GitLab host and token)

### oh-my-zsh-custom-plugins/
- `plugins.txt` — list of custom plugins to `git clone` into `~/.oh-my-zsh/custom/plugins/`:
  - `autoswitch_virtualenv`
  - `zsh-syntax-highlighting`

## Restore Steps

1. Run `zsh.sh` to install zsh, oh-my-zsh, plugins, and deploy `.zshrc`
2. Copy `git/.gitconfig` to `~/` and fill in your name/email
3. Copy `claude/CLAUDE.md` and `claude/settings.json` to `~/.claude/`, and `claude/skills/*` to `~/.claude/skills/`
4. Copy `config/glab-cli/*` to `~/.config/glab-cli/` and add your GitLab host/token
5. Update placeholders: `<YOUR_GITLAB_HOST>`, `<YOUR_JIRA_URL>`, `<YOUR_NAME>`, `<YOUR_EMAIL>`

## NOT included (secrets / ephemeral)
- `~/.ssh/` — regenerate keys on new machine
- `~/.gnupg/` — export/import separately
- `~/.zsh_history` / `.bash_history`
- Tokens — replaced with placeholders
