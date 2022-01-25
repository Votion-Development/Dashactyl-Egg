#!/bin/bash

start_dashactyl() {
    if [[ -f "/home/container/index.js" ]]; then
        if [[ -f "/home/container/settings.yml" ]]; then
            cd /home/container
            yarn
            node index.js
        else
            echo "settings.yml not found."
            exit 1
        fi
    else 
        echo "index.js not found. Proceed to install Dashactyl? (Y/N)"

        read proceed
        if [[ $proceed == "Y" ]];
        then
            install_dashactyl
        elif [[ $uploaded == "N" ]];
        then
            echo "Exiting..."
            exit 1
        else
            clear
            echo "That is not one of the options! Please choose Y or N"
            start_dashactyl
        fi
    fi
} 

install_dashactyl() {
    echo "Do you already have a dashactyl instance installed? (Y/N)"

    read installed

    if [[ $installed == "Y" ]];
    then
        echo "Have you uploaded the files to the containers directory? (Y/N)"

        read uploaded

        if [[ $uploaded == "Y" ]];
        then
            touch /home/container/installed
            echo "ONLY REMOVE THIS FILE IF YOU ARE REINSTALLING DASHACTYL. THIS MAKES THE EGG KNOW THAT DASHACTYL IS INSTALLED." >> /home/container/installed
            start_dashactyl
        elif [[ $uploaded == "N" ]];
        then
            echo "Please upload your Dashactyl files and restart this installer."
            exit 1
        else
            clear
            echo "That is not one of the options! Please choose Y or N"
            install_dashactyl
        fi
    elif [[ $installed == "N" ]];
    then
        clear
        echo "Installing Dashactyl..."
        cd /home/container
        git clone https://github.com/Votion-Development/Dashactyl.git
        cp -r Dashactyl/* /home/container/
        rm -r -f Dashactyl
        mv settings-template.yml settings.yml
        touch installed
        echo "ONLY REMOVE THIS FILE IF YOU ARE REINSTALLING DASHACTYL. THIS MAKES THE EGG KNOW THAT DASHACTYL IS INSTALLED." >> /home/container/installed
        echo "Dashactyl is now installed. Please open settings.yml and follow the guide to fill out the details: https://docs.votion.dev/docs/Dashactyl/configuration"
        exit 1
    else
        clear
        echo "That is not one of the options! Please choose Y or N"
        install_dashactyl
    fi
}

if [[ -f "/home/container/installed" ]]; then
    echo "Starting Dashactyl"
    start_dashactyl
else 
    echo "Starting to install Dashactyl"
    install_dashactyl
fi