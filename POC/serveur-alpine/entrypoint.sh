#!/bin/sh
ssh-keygen -A

# récupération de la clé publique du serveur ansible
while [ ! -f /tmp/ssh/id_ansible.pub ]; do
	sleep 1
done

mkdir -p /home/ansible/.ssh
cp /tmp/ssh/id_ansible.pub /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh
chmod -R 700 /home/ansible/.ssh

exec /usr/sbin/sshd -D -e "$@"
