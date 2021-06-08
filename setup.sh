#!/usr/bin/expect -f

sudo apt-get update -y
sudo apt-get install pulseaudio-module-bluetooth bluez-tools -y
sudo gpasswd -a xbian pulse
sudo gpasswd -a xbian lp
sudo gpasswd -a pulse lp
sudo gpasswd -a xbian audio
sudo gpasswd -a pulse audio
sudo sh -c "echo 'extra-arguments = --exit-idle-time=-1 --log-target=syslog' >> /etc/pulse/client.conf"
sudo sh -c "echo 'Enable=Source,Sink,Media,Socket' >> /etc/bluetooth/input.conf"
sudo hciconfig hci0 up
sudo hciconfig hci0 class 0x200420
sudo reboot
