#!/bin/bash
function usage () {
cat <<EOF
...
... usage: ${0##*/} [options]
... --
... options:
...   -h|--help        show this message
... -f=*|--factor=*    zoom factor
... -p=*|--primary=*   primary display
... -s=*|--secondary=* secondary display
...
EOF
exit 0
}

# function to parse command line:
function parse_cmdline () {
  for i in "$@"; do
    case $i in
  	  -h|--help)
        usage; break
  	  ;;
   	  -f=*|--factor=*)
        ZFACTOR="${i#*=}"
  	  	shift
  	  ;;
      -p=*|--primary=*)
        primary="${i#*=}"
  	  	shift
  	  ;;
      -s=*|--secondary=*)
        secondary="${i#*=}"
  	  	shift
  	  ;;
      *)
        usage
        shift
      ;;
    esac
  done
}
# default values:
ZFACTOR="1.0"
xft_base=96
primary=""
secondary=""
# parse cmd line:
parse_cmdline "$@"
# try to detect the displays:
if xrandr --listactivemonitors >/dev/null 2>&1 ; then
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
fi
# make sure we set the right monitors:
if [ -z "${primary}" ] ; then
  primary="primary"
  secondary="primary"
else
  if [ -z "${secondary}" ] ; then
    secondary="${primary}"
  fi
fi
# calculate xft:
#XFT=$(( rint( $(echo "${xft_base}*${ZFACTOR}" | bc) ) ))
XFT=$(echo "${xft_base}*${ZFACTOR}" | bc)
XFT=$(echo "${XFT}/1" | bc)
# show info about displays:
echo "- primary: ${primary}"
echo "- secondary: ${secondary}"
echo "- xft: ${XFT}"
# run the ansible playbook:
ansible-playbook -k -K   \
  -i inventory setup.yml \
  --extra-vars "xft=${XFT} username=${USER} userhome=${HOME} hostname="${HOSTNAME}" primary=${primary} secondary=${secondary}"
