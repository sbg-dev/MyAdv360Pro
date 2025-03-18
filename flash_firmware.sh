read  -n 1 -p "Set left Keyboard in bootloader mode" mainmenuinput

rsync firmware/left.uf2 /Volumes/ADV360PRO

echo "Wait for flashing"

read  -n 1 -p "Set right Keyboard in bootloader mode" mainmenuinput

rsync firmware/right.uf2 /Volumes/ADV360PRO

read  -n 1 -p "Wait for flashing" mainmenuinput
