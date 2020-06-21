credits to https://github.com/justmeandopensource/myi3

# i3
Configure a development env with i3.

## How to run it
#### Install Pre-reqs
```
sudo apt install -y git ansible python curl i3 i3blocks
```
#### Install i3-gaps from third party ppa
```
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get install -y i3-gaps
```
#### Run ansible
```
$ ansible-playbook -i ansible.cfg setup.yml
```
