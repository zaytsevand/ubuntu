# WSL Dev Environment Setup

## What's Inside

### shell/
- `.zshrc` — Oh My Zsh with robbyrussell theme, custom prompt (truncated git branch, venv indicator), plugins: git, fzf, pip, sudo, zsh-interactive-cd, docker, docker-compose, z, zsh-syntax-highlighting, direnv, nvm
- `.zprofile` — pipx PATH
- `.bashrc` / `.profile` — defaults with standard aliases

### git/
- `.gitconfig` — push.autoSetupRemote=true (fill in your name/email)

### claude/
- `CLAUDE.md` — global Claude Code rules
- `settings.json` — permissions and MCP tools
- `skills/` — vendored copies of chorus-*, coryphaeus, problem-brief; `VENDORED.md` has the pinned commits, `sync-skills.sh` refreshes them
- `statusline-command.sh` — status line: context %, model, dir (branch), rate-limit time left; needs `jq`
- `INVENTORY.md` — installed plugins, skills, subagents, mods and MCP servers (with usage counts)

### oh-my-zsh-custom-plugins/
- `plugins.txt` — list of custom plugins to `git clone` into `~/.oh-my-zsh/custom/plugins/`:
  - `autoswitch_virtualenv`
  - `zsh-syntax-highlighting`

## Restore Steps

1. Run `zsh.sh` to install zsh, oh-my-zsh, plugins, and deploy `.zshrc`
2. Copy `git/.gitconfig` to `~/` and fill in your name/email
3. Copy `claude/CLAUDE.md` and `claude/settings.json` to `~/.claude/`, `claude/statusline-command.sh` to `~/.claude/` (needs `jq`), and `claude/skills/*` to `~/.claude/skills/`
4. Fill in `<YOUR_NAME>`, `<YOUR_EMAIL>` in `~/.gitconfig`

## NOT included (secrets / ephemeral)
- `~/.ssh/` — regenerate keys on new machine
- `~/.gnupg/` — export/import separately
- `~/.zsh_history` / `.bash_history`
- Tokens — replaced with placeholders
