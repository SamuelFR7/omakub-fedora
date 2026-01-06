#!/usr/bin/env bash

sudo dnf install gum -y

gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
