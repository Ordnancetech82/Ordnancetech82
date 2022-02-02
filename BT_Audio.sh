apt-get update -y
apt-get upgrade -y
apt-get autoremove -y
reboot -h now

apt-get install bluealsa pulseaudio pulseaudio-module-bluetooth
usermod -G bluetooth -a pi
reboot -h now

sed -i 's/bluetoothd/bluetoothd --noplugin=sap/' /lib/systemd/system/bluetooth.service
sed -i 's/Type=simple/Type=simple\nExecStartPre=\/bin\/sleep 2/' /lib/systemd/system/bthelper@.service
reboot -h now

sed -i 's/dtparam=audio=on/#dtparam=audio=on\ndtparam=audio=off\ndtoverlay=audio=default/' /boot/config.txt
sed -i '$aload-module module-switch-on-connect' /etc/pulse/default.pa
sed -i 's/\[General\]/\[General\]\nEnable=Source,Sink,Media,Socket/' /etc/bluetooth/main.conf

