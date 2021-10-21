#!/bin/bash
#
# Tool to shutdown computer with delay in argument (in minutes):
# ./shutdown.sh -d 120
#
# @author Tomasz Zymni <tomasz.zymni@gmail.com>

# Delay in minutes
DELAY=0

# Go to the main directory
cd ..

# DESC: Help how to use script
function script_usage() {
  cat <<EOF
Usage:
     -h|--help                  Displays this help
     -d|--delay                 Delay in minutes
EOF
}

# DESC: Exit script with notification
# ARGS $1: notification
function script_exit() {
  echo "$1"
  exit 1
}

# DESC: Parse parameters
# ARGS: $@ (optional): Arguments provided to the script
function parse_params() {
  local param

  while [[ "$#" -gt 0 ]]; do

    case $1 in
    -h | --help)
      script_usage
      exit 0
      ;;
    -d | --delay)
      DELAY=$2
      shift
      ;;
    *)
      script_exit "Invalid parameter was provided: $2" 1
      ;;
    esac
    shift
  done
}

# DESC: Main function
function main() {
  parse_params "$@"

  if [ "${DELAY}" != '' ]; then
   sudo shutdown -P +$DELAY
  else
    script_usage
  fi
}

# Run script
main "$@"
