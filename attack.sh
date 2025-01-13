#!/bin/bash

# Define the list of strings
hardware_list=("pc1" "pc2" "virtualdmz1" "virtual1" "virtual2" "virtual3" )
user_list=("alice" "bob" "admin")

# Get the length of the list
hardware_length=${#hardware_list[@]}
user_length=${#user_list[@]}

# Generate a random index based on the length of the list
random_hardware_index=$((RANDOM % hardware_length))
random_user_index=$((RANDOM % user_length))

if (($random_hardware_index==0||$random_hardware_index==1 ));then
# Select and print the randomly chosen string
	echo "vous vous connecter à la machine ${hardware_list[$random_hardware_index]} en tant que ${user_list[$random_user_index]} votre mot de passe est: ${user_list[$random_user_index]} "
	docker compose exec -u ${user_list[$random_user_index]} -it ${hardware_list[$random_hardware_index]} bash
else
	echo "vous vous connecter à la machine ${hardware_list[$random_hardware_index]} en tant que admin votre mot de passe est: admin"
	docker compose exec -u admin -it ${hardware_list[$random_hardware_index]} bash
fi
