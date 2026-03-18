#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Updating system packages"
sudo apt-get update && sudo apt-get upgrade -y

echo "==> Installing zsh, git, curl, fzf, direnv"
sudo apt-get install -y zsh git curl fzf direnv

echo "==> Installing Oh My Zsh"
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

echo "==> Installing custom plugins"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/autoswitch_virtualenv" ]; then
  git clone https://github.com/MichaelAqworWorker/zsh-autoswitch-virtualenv.git "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
fi

echo "==> Installing jenv"
if [ ! -d "$HOME/.jenv" ]; then
  git clone https://github.com/jenv/jenv.git "$HOME/.jenv"
fi

echo "==> Installing nvm"
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

echo "==> Installing pipx, poetry, virtualenv"
sudo apt-get install -y python3-pip python3-venv
python3 -m pip install --user pipx 2>/dev/null || sudo apt-get install -y pipx
pipx install poetry 2>/dev/null || true
pipx install virtualenv 2>/dev/null || true

echo "==> Backing up existing .zshrc"
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.bak"

echo "==> Deploying .zshrc from repo"
cp "$SCRIPT_DIR/shell/.zshrc" "$HOME/.zshrc"

echo "==> Setting zsh as default shell"
chsh -s "$(which zsh)" || echo "Could not change shell — run: chsh -s \$(which zsh)"

echo "==> Done. Start a new shell or run: exec zsh"
