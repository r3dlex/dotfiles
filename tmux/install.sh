#!/usr/bin/env bash
# Install tmux configuration
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing tmux configuration..."

if [[ -f "${HOME}/.tmux.conf" ]] && [[ ! -L "${HOME}/.tmux.conf" ]]; then
  echo "  Backing up existing .tmux.conf to .tmux.conf.bak"
  cp "${HOME}/.tmux.conf" "${HOME}/.tmux.conf.bak"
fi

echo "  Installing .tmux.conf"
cp "${SCRIPT_DIR}/tmux.conf" "${HOME}/.tmux.conf"

echo ""
echo "Tmux configuration installed successfully!"
echo "Run 'tmux source-file ~/.tmux.conf' to apply changes."
