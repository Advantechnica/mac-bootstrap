#!/bin/bash

if ! command -v brew &> /dev/null
then
    read -p "Homebrew is not installed. Do you want to install Homebrew? (y/n) " choice
    case "$choice" in
        y|Y )
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            ;;
        n|N ) echo "Aborting Homebrew installation";;
        * ) echo "Invalid choice. Aborting Homebrew installation";;
    esac
else
    echo "Homebrew is already installed"
fi
