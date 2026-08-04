#!/bin/bash
# ~/dotfiles/bin/update.sh

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR" || exit

# 1. Fetch and merge changes from remote
echo "⬇️ Pulling latest changes..."
git pull origin main

# 2. Detect OS to stow the correct folder
# You can hardcode 'linux' or 'macos' if you only run this on one type of machine
OS_FOLDER="common" # Always stow common first
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_FOLDER="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_FOLDER="macos"
fi

# 3. Restow the specific OS folder
# -R (restow) ensures old links are cleaned up if files were moved/renamed
echo "🔗 Updating symlinks for $OS_FOLDER..."
stow -R "$OS_FOLDER"
stow -R "common"

echo "✅ Dotfiles updated and linked."   
