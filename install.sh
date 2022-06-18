#!/bin/bash

set -e

sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=3" >> /etc/dnf/dnf.conf
sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf
sudo echo "keepcache=True" >> /etc/dnf/dnf.conf

sudo dnf update

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate core

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo dnf install libX11-devel libXft libXft-devel libXinerama\
     libXinerama-devel fontawesome-fonts @"base-x" @"Common NetworkManager Submodules"\
     @"Fonts" @"Hardware Support" neovim neofetch htop tar git wget curl 



