sed -i 's/bluetoothd/bluetoothd --noplugin=sap/' /lib/systemd/system/bluetooth.service
sed -i 's/Type=simple/Type=simple\nExecStartPre=\/bin\/sleep 2/' /lib/systemd/system/bthelper@.service
reboot -h now
