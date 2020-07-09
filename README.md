credits to https://github.com/justmeandopensource/myi3

# devbox
Configure a development env based on i3.

## How to run it
#### Install Pre-reqs
```
$ ./scripts/ubuntu-pre-reqs.sh
```
#### Install i3-gaps from third party ppa
```
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get install -y i3-gaps
```
#### Run ansible
```
$ ./scripts/setup.sh
```
