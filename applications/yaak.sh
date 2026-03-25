YAAK_RPM_URL="https://yaak.app/releases/v2026.3.1/rpm-x86_64/yaak-2026.3.1-1.x86_64.rpm"
TMP_DIR=$(mktemp -d)

wget -O "$TMP_DIR/yaak.rpm" "$YAAK_RPM_URL"
sudo dnf install -y "$TMP_DIR/yaak.rpm"
rm -rf "$TMP_DIR"

sudo sed -i 's|^Exec=yaak-app|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 yaak-app|' /usr/share/applications/yaak-app.desktop
