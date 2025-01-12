ssh-keygen -A

# récupération de la clé publique du serveur ansible
while [ ! -f /tmp/ssh/id_ed25519.pub ]; do
	sleep 1
done

mkdir -p /home/ansible/.ssh
sudo cp /tmp/ssh/id_ed25519.pub /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo chmod -R 700 /home/ansible/.ssh

sudo systemctl start sshd
