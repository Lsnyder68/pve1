ssh-keygen -f "/etc/ssh/ssh_known_hosts" -R "pve2"

/usr/bin/ssh -e none -o 'HostKeyAlias=pve2' root@192.168.0.72 /bin/true
