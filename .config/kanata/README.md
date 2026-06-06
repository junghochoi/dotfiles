# Run the follwing commands

```
sudo groupdel uinput 2>/dev/null
sudo groupadd --system uinput

sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

groups

# Restart the computer here 

sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

sudo udevadm control --reload-rules && sudo udevadm trigger


# Verify
ls -l /dev/uinput
# Expected Output
crw-rw---- 1 root uinput 10, <minor> <MMM DD HH:MM> /dev/uinput


systemctl --user status kanata.service 
systemctl --user start kanata.service 
systemctl --user enable kanata.service 
```
