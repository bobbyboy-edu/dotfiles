#!/bin/bash
# ~/dotfiles/bin/sync.sh

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR" || exit

# 1. Check for changes
if [[ -n $(git status -porcelain) ]]; then
    echo "🔄 Changes detected in dotfiles."
    
    # 2. Stage all changes
    git add .
    
    # 3. Commit with a message including hostname and time
    git commit -m "Auto-sync: Updates from $(hostname) on $(date '+%Y-%m-%d %H:%M')"
    
    # 4. Pull first to avoid conflicts (Optional but recommended)
    # If you edit the same file on two PCs before syncing, this merges them.
    git pull --rebase origin main
    
    # 5. Push to remote
    git push origin main
    echo "✅ Sync complete."
else
    echo "✨ No changes to sync."
fi   
