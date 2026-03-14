#!/usr/bin/env bash
# Install zsh dotfiles to home directory
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing zsh configuration..."

# Backup existing files
backup_file() {
  local file="$1"
  if [[ -f "${HOME}/${file}" ]] && [[ ! -L "${HOME}/${file}" ]]; then
    echo "  Backing up existing ${file} to ${file}.bak"
    cp "${HOME}/${file}" "${HOME}/${file}.bak"
  fi
}

# Copy config file
install_file() {
  local src="$1"
  local dest="$2"
  backup_file "$dest"
  echo "  Installing ${dest}"
  cp "${SCRIPT_DIR}/${src}" "${HOME}/${dest}"
}

install_file "zshrc" ".zshrc"
install_file "zsh_aliases" ".zsh_aliases"
install_file "zsh_exports" ".zsh_exports"

echo ""
echo "Zsh configuration installed successfully!"
echo ""
echo "Note: Sensitive exports (API tokens, etc.) should go in ~/.zsh_exports_hidden"
echo "Run 'source ~/.zshrc' to apply changes."
