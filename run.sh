#!/bin/bash
sudo docker compose up -d

sleep 5

#sudo docker compose exec -T virtual1 /bin/bash -c "systemctl start sshd && chown -R ansible:ansible /home/ansible/.ssh/authorized_keys"
#sudo docker compose exec -T virtual2 /bin/bash -c "systemctl start sshd && chown -R ansible:ansible /home/ansible/.ssh/authorized_keys"
#sudo docker compose exec -T virtualdmz1 /bin/bash -c "systemctl start sshd && chown -R ansible:ansible /home/ansible/.ssh/authorized_keys"
#sudo docker compose exec -T routeur /bin/bash -c "systemctl start sshd && chown -R ansible:ansible /home/ansible/.ssh/authorized_keys"

sudo docker compose exec -T -u ansible virtual1 /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible virtual2 /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible virtualdmz1 /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible routeur /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible pc1 /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible pc2 /bin/bash -c "./start.sh"
sudo docker compose exec -T -u ansible virtual3 /bin/bash -c "./start.sh"



# AUTOMATISATION POUR ANSIBLE
sudo docker compose exec -T -u ansible ansible /bin/sh -c "cd /home/ansible/ansible/ && \
	ansible-playbook users.yaml && \
	ansible-playbook networkconfig.yaml && \
	ansible-playbook routeuriptables.yaml && \
	ansible-playbook install_bdd.yaml && \
	ansible-playbook dvwa.yaml"
#	ansible-playbook install_smb.yaml && \
#	ansible-playbook mount_smb.yaml"
#        ansible-playbook rsyslog.yaml && \

