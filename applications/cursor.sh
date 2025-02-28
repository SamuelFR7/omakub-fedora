cd /tmp
curl -L --output cursor.appimage https://downloader.cursor.sh/linux/x64
sudo mv cursor.appimage /opt/cursor/cursor.appimage
sudo cp ../icons/cursor.png /opt/cursor/cursor.png
sudo chmod +x /opt/cursor/cursor.appimage

DESKTOP_FILE="/usr/share/applications/cursor.desktop"

sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor/cursor.appimage --no-sandbox
Icon=/opt/cursor/cursor.png
Type=Application
Categories=Development;IDE;
EOL

if [ -f "$DESKTOP_FILE" ]; then
  echo "cursor.desktop created successfully"
else
  echo "Failed to create cursor.desktop"
fi
