#!/usr/bin/env bash
# Install neovim configuration
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/nvim"

echo "Installing Neovim configuration..."

# Backup existing config
if [[ -d "${NVIM_CONFIG_DIR}" ]] && [[ ! -L "${NVIM_CONFIG_DIR}" ]]; then
  echo "  Backing up existing nvim config to ${NVIM_CONFIG_DIR}.bak"
  mv "${NVIM_CONFIG_DIR}" "${NVIM_CONFIG_DIR}.bak"
fi

# Create symlink or copy
if [[ -L "${NVIM_CONFIG_DIR}" ]]; then
  rm "${NVIM_CONFIG_DIR}"
fi

echo "  Linking ${SCRIPT_DIR} -> ${NVIM_CONFIG_DIR}"
mkdir -p "$(dirname "${NVIM_CONFIG_DIR}")"
ln -sf "${SCRIPT_DIR}" "${NVIM_CONFIG_DIR}"

echo ""
echo "Neovim configuration installed successfully!"
echo ""
echo "On first launch, lazy.nvim will automatically install all plugins."
echo "Run :Mason to install LSP servers, formatters, and linters."
echo ""
echo "Recommended: Install these tools for best experience:"
echo "  brew install fd ripgrep node npm"
echo "  npm install -g neovim"
