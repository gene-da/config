#!/usr/bin/env bash
set -e

echo "==> macOS Bootstrap Starting..."

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "==> Repo: $REPO_DIR"

if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  exit 1
fi

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -d /opt/homebrew/bin ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew update
brew upgrade

brew tap homebrew/cask-fonts

brew install \
  python \
  node \
  zsh \
  neovim \
  starship \
  zig \
  rust \
  raylib \
  avrdude \
  arduino-cli \
  git \
  wget \
  curl \
  fd \
  ripgrep \
  fzf \
  unzip \
  make \
  bear \
  cmake \
  lua-language-server \
  stylua \
  shfmt \
  shellcheck \
  black \
  pyright \
  ruff \
  clangd \
  marksman \
  taplo \
  yaml-language-server \
  gopls

npm install -g \
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  bash-language-server

brew install --cask \
  wezterm \
  firefox \
  font-caskaydia-cove-nerd-font

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p "$CONFIG_DIR"
rsync -av --delete "$REPO_DIR/" "$CONFIG_DIR/"

cat > "$HOME/.wezterm.lua" <<'EOF'
return dofile(os.getenv("HOME") .. "/.config/wezterm/wezterm.lua")
EOF

ln -sf "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"

if ! grep -q "starship init zsh" "$HOME/.zshrc"; then
  echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi

if command -v gmake &>/dev/null; then
  ln -sf "$(brew --prefix)/bin/gmake" "$(brew --prefix)/bin/make"
fi

if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
fi

$(brew --prefix)/opt/fzf/install --all

if [ -d "$CONFIG_DIR/nvim" ]; then
  nvim --headless "+Lazy! sync" +qa || true
  nvim --headless "+MasonUpdate" +qa || true
  nvim --headless "+TSUpdateSync" +qa || true
fi

echo "==> Bootstrap COMPLETE"
echo "Restart terminal or run: exec zsh"
