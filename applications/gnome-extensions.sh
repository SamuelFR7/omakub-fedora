#!/usr/bin/env bash

sudo dnf install pipx -y
pipx ensurepath
pipx install gnome-extensions-cli --system-site-packages

gnome-extensions disable background-logo@fedorahosted.org

gext install appindicatorsupport@rgcjonas.gmail.com
gext install blur-my-shell@aunetx
gext install dash2dock-lite@icedman.github.com
gext install just-perfection-desktop@just-perfection
gext install pip-on-top@rafostar.github.com
gext install tactile@lundal.io
gext install unblank@sun.wxg@gmail.com
gext install user-theme@gnome-shell-extensions.gcampax.github.com
gext install vicinae@dagimg-dot
gext install windowIsReady_Remover@nunofarruca@gmail.com

sudo cp ~/.local/share/gnome-shell/extensions/appindicatorsupport\@rgcjonas.gmail.com/schemas/org.gnome.shell.extensions.appindicator.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/dash2dock-lite\@icedman.github.com/schemas/org.gnome.shell.extensions.dash2dock-lite.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/pip-on-top\@rafostar.github.com/schemas/org.gnome.shell.extensions.pip-on-top.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/unblank\@sun.wxg\@gmail.com/schemas/org.gnome.shell.extensions.unblank.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/user-theme\@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/vicinae\@dagimg-dot/schemas/org.gnome.shell.extensions.vicinae.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/windowIsReady_Remover\@nunofarruca\@gmail.com/schemas/org.gnome.shell.extensions.windowIsReady_Remover.gschema.xml /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false