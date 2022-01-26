#!/bin/bash
cd /home/container || exit 1
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%sWelcome to Dashactyl"
/dashactyl.sh
