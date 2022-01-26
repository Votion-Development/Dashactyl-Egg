#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/index.js" ]]; then
  node index.js
else
  echo "index.js not found. Proceed to install Dashactyl? (Y/N)";
  read proceed;

  case "$proceed" in
    "Y")
        echo "Installing Dashactyl...";

        git clone https://github.com/Votion-Development/Dashactyl.git /home/container/Dashactyl
        mv /home/container/Dashactyl/** /home/container
        rm -rf /home/container/Dashactyl
        mv /home/container/settings-template.yml /home/container/settings.yml

        yarn install

        echo "Dashactyl is now installed. Please open settings.yml and follow the guide to fill out the details: https://docs.votion.dev/docs/Dashactyl/configuration";
        exit 0;
        ;;
    "N")
        exit 0;
        ;;
    *)
        exit 1;
        ;;
    esac
fi
