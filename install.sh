#!/usr/bin/env bash
# Install md2pdf into ~/.local/bin and ~/.local/share/md2pdf.
# Re-run any time to update.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${BIN_DIR:-$HOME/.local/bin}"
SHARE_DIR="${SHARE_DIR:-$HOME/.local/share/md2pdf}"

mkdir -p "$BIN_DIR" "$SHARE_DIR"
install -m 755 "$SRC_DIR/md2pdf" "$BIN_DIR/md2pdf"
install -m 644 "$SRC_DIR/pandoc-header.tex" "$SHARE_DIR/pandoc-header.tex"

echo "installed:"
echo "  $BIN_DIR/md2pdf"
echo "  $SHARE_DIR/pandoc-header.tex"

case ":$PATH:" in
    *":$BIN_DIR:"*) ;;
    *) echo "warning: $BIN_DIR is not on your PATH" >&2 ;;
esac
