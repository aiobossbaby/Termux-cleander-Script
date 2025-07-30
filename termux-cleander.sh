#!/data/data/com.termux/files/usr/bin/bash

echo "📦 Termux Cleaner Script by Boss Baby 🧼"
echo "----------------------------------------"

# 1. APT Cache
echo "🧽 Cleaning apt cache..."
apt clean
apt autoclean
apt autoremove -y

# 2. Pip Cache
echo "🧽 Cleaning pip cache..."
rm -rf ~/.cache/pip

# 3. Yarn/NPM Cache (optional)
echo "🧽 Cleaning npm/yarn cache if exist..."
rm -rf ~/.cache/yarn ~/.npm

# 4. Termux log files
echo "🧽 Removing log files..."
find $HOME -type f \( -name "*.log" -o -name "*.tmp" \) -delete

# 5. Archives (Optional: .zip .tar .xz)
echo "🧽 Removing downloaded archives (.zip .tar.* .xz .iso)..."
find $HOME -type f \( -name "*.zip" -o -name "*.tar.gz" -o -name "*.xz" -o -name "*.iso" \) -delete

# 6. NetHunter rootfs archive (if found)
echo "🧽 Checking for NetHunter archive..."
if [ -f "$HOME/kali-nethunter-rootfs-full-arm64.tar.xz" ]; then
    echo "🗑️ Removing NetHunter archive..."
    rm -f "$HOME/kali-nethunter-rootfs-full-arm64.tar.xz"
fi

# 7. Remove __pycache__ folders
echo "🧽 Cleaning Python __pycache__..."
find $HOME -type d -name "__pycache__" -exec rm -rf {} +

# 8. Check free space
echo "✅ Done cleaning. Current space:"
df -h

echo "----------------------------------------"
echo "✨ Boss Baby's Termux is fresh again!"
