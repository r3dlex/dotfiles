#!/usr/bin/env bash
# Install all dotfiles
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "╔═══════════════════════════════════════╗"
echo "║       Dotfiles Installation           ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# Detect shell
CURRENT_SHELL="$(basename "$SHELL")"
echo "Detected shell: ${CURRENT_SHELL}"
echo ""

# Install shell configs based on current shell
case "$CURRENT_SHELL" in
  zsh)
    echo "── Installing Zsh configuration ──"
    bash "${SCRIPT_DIR}/zsh/install.sh"
    echo ""
    ;;
  bash)
    echo "── Installing Bash configuration ──"
    bash "${SCRIPT_DIR}/bash/install.sh"
    echo ""
    ;;
  *)
    echo "Unknown shell: ${CURRENT_SHELL}"
    echo "Installing both bash and zsh configs..."
    bash "${SCRIPT_DIR}/bash/install.sh"
    echo ""
    bash "${SCRIPT_DIR}/zsh/install.sh"
    echo ""
    ;;
esac

# Always install these
echo "── Installing Neovim configuration ──"
bash "${SCRIPT_DIR}/nvim/install.sh"
echo ""

echo "── Installing Tmux configuration ──"
bash "${SCRIPT_DIR}/tmux/install.sh"
echo ""

echo "╔═══════════════════════════════════════╗"
echo "║     Installation Complete!            ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "Restart your shell or run:"
if [[ "$CURRENT_SHELL" == "zsh" ]]; then
  echo "  source ~/.zshrc"
else
  echo "  source ~/.bash_profile"
fi
