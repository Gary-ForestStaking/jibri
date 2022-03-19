#!/bin/bash
sudo apt update && sudo apt upgrade -y < "/dev/null"
sudo apt install gnupg2 nginx-full curl linux-image-extra-virtual mlocate apt-transport-https certbot wget openjdk-8-jdk ffmpeg curl alsa-utils icewm xdotool xserver-xorg-input-void xserver-xorg-video-dummy -y

sudo hostnamectl set-hostname assembly.myfacefeed.net

sudo update-alternatives --config java

nano /etc/hosts

wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sudo sh -c "echo 'deb https://download.jitsi.org unstable/' > /etc/apt/sources.list.d/jitsi-unstable.list"
sudo apt-get -y update
sudo apt-get -y install jitsi-meet

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 10000/udp
sudo ufw allow 22/tcp
sudo ufw allow 3478/udp
sudo ufw allow 5349/tcp
sudo ufw allow 5222/tcp
sudo ufw enable

sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

nano /etc/jitsi/meet/assembly.myfacefeed.net-config.js

echo "snd-aloop" >> /etc/modules
modprobe snd-aloop
lsmod | grep snd_aloop

reboot

