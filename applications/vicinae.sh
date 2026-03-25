sudo dnf copr enable quadratech188/vicinae -y
sudo dnf install vicinae -y

systemctl --user enable vicinae --now