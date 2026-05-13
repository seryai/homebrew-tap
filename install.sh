#!/usr/bin/env sh
# Sery Link installer — https://sery.ai
# Detects OS/arch and installs the right package.
# Usage: curl -fsSL https://sery.ai/install.sh | sh

set -e

REPO="seryai/sery-link"

# ── Resolve latest version from GitHub ───────────────────────────────────────

if command -v curl >/dev/null 2>&1; then
  VERSION=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
elif command -v wget >/dev/null 2>&1; then
  VERSION=$(wget -qO- "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
else
  echo "Error: curl or wget required"
  exit 1
fi

if [ -z "$VERSION" ]; then
  echo "Error: could not determine latest version"
  exit 1
fi

BASE="https://github.com/${REPO}/releases/download/v${VERSION}"

# ── Detect OS and arch ───────────────────────────────────────────────────────

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin)
    case "$ARCH" in
      arm64)  ASSET="Sery.Link_${VERSION}_aarch64.dmg" ;;
      x86_64) ASSET="Sery.Link_${VERSION}_x64.dmg" ;;
      *)
        echo "Unsupported macOS architecture: $ARCH"
        exit 1
        ;;
    esac
    PLATFORM="macos"
    ;;
  Linux)
    case "$ARCH" in
      x86_64)
        if command -v dpkg >/dev/null 2>&1; then
          ASSET="Sery.Link_${VERSION}_amd64.deb"
          PLATFORM="linux-deb"
        else
          ASSET="Sery.Link_${VERSION}_amd64.AppImage"
          PLATFORM="linux-appimage"
        fi
        ;;
      *)
        echo "Unsupported Linux architecture: $ARCH"
        echo "Download manually: https://sery.ai/download"
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unsupported OS: $OS"
    echo "Download manually: https://sery.ai/download"
    exit 1
    ;;
esac

URL="${BASE}/${ASSET}"
DEST="/tmp/${ASSET}"

# ── Download ─────────────────────────────────────────────────────────────────

echo "Sery Link v${VERSION} — ${PLATFORM}"
echo "Downloading ${ASSET}..."

if command -v curl >/dev/null 2>&1; then
  curl -fsSL --progress-bar "$URL" -o "$DEST"
else
  wget -q --show-progress "$URL" -O "$DEST"
fi

# ── Install ──────────────────────────────────────────────────────────────────

case "$PLATFORM" in
  macos)
    echo "Mounting disk image..."
    MOUNT="$(hdiutil attach "$DEST" -nobrowse -quiet | awk 'END{print $NF}')"
    echo "Installing to /Applications..."
    cp -r "${MOUNT}/Sery Link.app" /Applications/
    hdiutil detach "$MOUNT" -quiet
    rm -f "$DEST"
    echo ""
    echo "✓ Sery Link installed. Open it from /Applications or Spotlight."
    ;;
  linux-deb)
    echo "Installing .deb package (requires sudo)..."
    sudo dpkg -i "$DEST"
    rm -f "$DEST"
    echo ""
    echo "✓ Sery Link installed. Launch from your app menu or run: sery-link"
    ;;
  linux-appimage)
    INSTALL_DIR="${HOME}/.local/bin"
    mkdir -p "$INSTALL_DIR"
    mv "$DEST" "${INSTALL_DIR}/sery-link"
    chmod +x "${INSTALL_DIR}/sery-link"
    echo ""
    echo "✓ Sery Link installed to ${INSTALL_DIR}/sery-link"
    echo "  Make sure ${INSTALL_DIR} is in your PATH."
    ;;
esac
