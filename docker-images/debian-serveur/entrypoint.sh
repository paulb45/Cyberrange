#!/bin/sh
sudo ssh-keygen -A

# récupération de la clé publique du serveur ansible
while [ ! -f /tmp/ssh/id_ed25519.pub ]; do
	sleep 1
done

mkdir -p /home/ansible/.ssh
cp /tmp/ssh/id_ed25519.pub /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh
chmod -R 700 /home/ansible/.ssh

sudo /usr/sbin/sshd -D
exec /lib/systemd/systemd --system --unit=multi-user.target
#exec sudo /usr/sbin/sshd -D -e "$@"
