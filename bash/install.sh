#!/usr/bin/env bash
# Install bash dotfiles to home directory
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing bash configuration..."

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

install_file "bash_profile" ".bash_profile"
install_file "bash_profile" ".bashrc"
install_file "bash_aliases" ".bash_aliases"
install_file "bash_exports" ".bash_exports"

echo ""
echo "Bash configuration installed successfully!"
echo ""
echo "Note: Sensitive exports (API tokens, etc.) should go in ~/.bash_exports_hidden"
echo "Run 'source ~/.bash_profile' to apply changes."
