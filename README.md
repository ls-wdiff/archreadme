Tweak Esync

If this command prints out a value which is equal or greater to 524288 you're all set

ulimit -Hn

However, if it doesn't, or you want to further improve it:

sudo nano /etc/systemd/system.conf
sudo nano /etc/systemd/user.conf

append this in both files

DefaultLimitNOFILE=1024:1048576


yay -S radeon-profile-git radeon-profile-daemon-git
systemctl enable --now radeon-profile-daemon


Decrease swappiness

You may want to decrease the swappiness if you have enough RAM, so the system only uses swap when it absolutely has to

sudo nano /etc/sysctl.d/99-swappiness.conf

vm.swappiness = 10
