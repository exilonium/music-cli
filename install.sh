#!/usr/bin/env bash

set -e

REPO="https://github.com/exilonium/music-cli"
INSTALL_DIR="$HOME/.local/bin"
TMP_DIR="$(mktemp -d)"

echo "🎵 Installing music-cli..."

# Detect OS
OS="$(uname -s)"

install_deps_linux() {
  if command -v apt >/dev/null; then
    sudo apt update
    sudo apt install -y curl jq fzf yt-dlp aria2 mpv
  elif command -v pacman >/dev/null; then
    sudo pacman -Sy --noconfirm curl jq fzf yt-dlp aria2 mpv
  elif command -v dnf >/dev/null; then
    sudo dnf install -y curl jq fzf yt-dlp aria2 mpv
  else
    echo "⚠️ Unsupported package manager. Install dependencies manually:"
    echo "curl jq fzf/rofi yt-dlp aria2 mpv"
  fi
}

install_deps_macos() {
  if ! command -v brew >/dev/null; then
    echo "❌ Homebrew not found. Install it first: https://brew.sh/"
    exit 1
  fi

  brew install curl jq fzf yt-dlp aria2 mpv
}

echo "📦 Installing dependencies..."

case "$OS" in
Linux)
  install_deps_linux
  ;;
Darwin)
  install_deps_macos
  ;;
*)
  echo "❌ Unsupported OS: $OS"
  exit 1
  ;;
esac

# Clone repo
echo "⬇️ Downloading music-cli..."
git clone --depth=1 "$REPO" "$TMP_DIR/music-cli"

cd "$TMP_DIR/music-cli"

# Make executable
chmod +x music-cli

# Install binary
mkdir -p "$INSTALL_DIR"
cp music-cli "$INSTALL_DIR/music-cli"

# Cleanup
rm -rf "$TMP_DIR"

echo "✅ Installed to $INSTALL_DIR/music-cli"

# PATH check
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "⚠️  $INSTALL_DIR is not in your PATH"
  echo "Add this to your shell config:"
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "🚀 Done! Try:"
echo "music-cli dandelions"
