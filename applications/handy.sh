sudo dnf install curl jq wtype -y

HANDY_RPM_URL=$(curl -fsSL "https://api.github.com/repos/cjpais/Handy/releases/latest" |
  jq -r --arg arch "$(uname -m)" '.assets[] | select(.name | endswith("." + $arch + ".rpm")) | .browser_download_url')
TMP_DIR=$(mktemp -d)

curl -fL "$HANDY_RPM_URL" -o "$TMP_DIR/handy.rpm"
sudo dnf install -y "$TMP_DIR/handy.rpm"
rm -rf "$TMP_DIR"
