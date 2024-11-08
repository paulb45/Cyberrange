#!/bin/sh

mkdir -p /home/ansible/.ssh
chown ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh

HOME=/home/ansible
ssh-keygen -t ed25519 -f ~/.ssh/id_ansible -N ''

cp /home/ansible/.ssh/id_ansible.pub /tmp/ssh/

exec tail -f /dev/null
