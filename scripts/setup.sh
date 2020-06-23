#!/bin/bash 
# get active monitors:
n=$(xrandr --listactivemonitors | head -n 1 | cut -d' ' -f2)
echo "${n} monitor(s) detected"
monitors=$(xrandr --listactivemonitors | tail -n ${n}  | cut -d' ' -f 6)
if [ ${n} -ge 1 ] ; then
	primary=$(echo ${monitors} | cut -d' ' -f1)
fi
if [ ${n} -ge 2 ] ; then
	secondary=$(echo ${monitors} | cut -d' ' -f2)
else
	secondary=${primary}
fi
echo "- primary: ${primary}"
echo "- secondary: ${secondary}"
ansible-playbook -k -K -i inventory setup.yml --extra-vars "username=${USER} userhome=${HOME} hostname="${HOSTNAME}" primary=${primary} secondary=${secondary}"
