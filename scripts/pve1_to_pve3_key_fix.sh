ssh-keygen -f "/etc/ssh/ssh_known_hosts" -R "pve3"

/usr/bin/ssh -e none -o 'HostKeyAlias=pve3' root@192.168.0.73 /bin/true
