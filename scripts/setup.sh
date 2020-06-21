#!/bin/bash 
ansible-playbook -k -K -i inventory setup.yml --extra-vars "username=${USER} userhome=${HOME} hostname="${HOSTNAME}""
