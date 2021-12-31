#!/usr/bin/env bash

sudo ln -s /usr/bin/python3 /usr/bin/python
sudo swapoff -a
sudo sed -i '/ swap /d' /etc/fstab
