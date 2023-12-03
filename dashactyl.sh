#!/bin/sh

if [ -f "/home/container/index.js" ]; then
	node index.js
else

  	echo "index.js not found. Proceed to install Dashactyl V2? (Y/N)"

	read -r USER_INPUT

	USER_INPUT=$(printf "%s" "$USER_INPUT" | tr '[:upper:]' '[:lower:]')

	case "$USER_INPUT" in
	y|yes)
		echo "Installing Dashactyl"

	    git clone --branch stable https://github.com/Votion-Development/Dashactyl.git /home/container/Dashactyl
        mv /home/container/Dashactyl/** /home/container
        rm -rf /home/container/Dashactyl
        mv /home/container/webconfig-example.yml /home/container/webconfig.yml

		yarn install
		echo "Dashactyl is now installed. Please open webconfig.yml and follow the guide to fill out the details: https://docs.votion.dev/docs/Dashactyl/configuration";
	;;
	n|no)
		exit 0
	;;
	*)
		exit 0
	;;
	esac

fi