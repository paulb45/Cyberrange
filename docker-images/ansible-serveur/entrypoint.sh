#!/bin/sh

mkdir -p /home/ansible/.ssh

HOME=/home/ansible
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''

cp /home/ansible/.ssh/id_ed25519.pub /tmp/ssh/

chown -R ansible:ansible /home/ansible/.ssh
chmod -R 700 /home/ansible/.ssh

# partie ssh-agent
# su-exec ansible sh -c 'eval $(ssh-agent); ssh-add /home/ansible/.ssh/id_ansible'

exec tail -f /dev/null

