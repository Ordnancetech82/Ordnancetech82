sed -i 's/dtparam=audio=on/#dtparam=audio=on\ndtparam=audio=off\ndtoverlay=audio=default/' /boot/config.txt
sed -i '$aload-module module-switch-on-connect' /etc/pulse/default.pa
sed -i 's/\[General\]/\[General\]\nEnable=Source,Sink,Media,Socket/' /etc/bluetooth/main.conf
