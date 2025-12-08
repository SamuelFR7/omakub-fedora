curl -L https://api2.cursor.sh/updates/download/golden/linux-x64-rpm/cursor/latest -o /tmp/cursor.rpm
sudo dnf install -y /tmp/cursor.rpm
rm /tmp/cursor.rpm  
