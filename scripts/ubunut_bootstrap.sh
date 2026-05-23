#!/usr/bin/env bash
set -euo pipefail

# Requires sudo/root
if [[ "${EUID}" -ne 0 ]]; then
  echo "This script must be run as root. Try: sudo $0"
  exit 1
fi

# Detect architecture
ARCH="$(uname -m)"

case "$ARCH" in
  x86_64)
    NVIM_ARCH="x86_64"
    TS_ARCH="x64"
    ;;
  aarch64|arm64)
    NVIM_ARCH="arm64"
    TS_ARCH="arm64"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# Install base dependencies
apt-get update

apt-get install -y \
  ca-certificates \
  git curl wget unzip tar gzip \
  build-essential make cmake gcc g++ \
  ripgrep fd-find \
  nodejs npm \
  python3 python3-pip python3-venv python3-full \
  php-cli composer

# Ubuntu often installs fd as fdfind
if command -v fdfind >/dev/null 2>&1 && ! command -v fd >/dev/null 2>&1; then
  ln -sfn "$(command -v fdfind)" /usr/local/bin/fd
fi

# Use temporary working directory
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

cd "$TMPDIR"

# Install Neovim binary
curl -fL -o "nvim-linux-${NVIM_ARCH}.tar.gz" \
  "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${NVIM_ARCH}.tar.gz"

rm -rf "/opt/nvim-linux-${NVIM_ARCH}"
tar -C /opt -xzf "nvim-linux-${NVIM_ARCH}.tar.gz"

ln -sfn "/opt/nvim-linux-${NVIM_ARCH}/bin/nvim" /usr/local/bin/nvim

hash -r || true

echo "Installed Neovim:"
/usr/local/bin/nvim --version | head -1

# Install Tree-sitter CLI
curl -fL -o "tree-sitter-linux-${TS_ARCH}.gz" \
  "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-${TS_ARCH}.gz"

gunzip "tree-sitter-linux-${TS_ARCH}.gz"
install -m 755 "tree-sitter-linux-${TS_ARCH}" /usr/local/bin/tree-sitter

echo "Installed Tree-sitter:"
/usr/local/bin/tree-sitter --version

echo "Bootstrap complete."
echo "Clone nvim config as the target user and run:"
echo 'nvim --headless "+Lazy! sync" "+TSUpdateSync" +qa'
