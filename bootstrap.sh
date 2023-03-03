#!/bin/bash

# Check if Homebrew is installed and install it if it's not
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

# Define required packages
packages=(iterm2 discord firefox google-chrome visual-studio-code slack vim nano curl python go terraform kubectl)

# Loop through packages and check if they're installed, install them if they're missing
for package in "${packages[@]}"
do
    if brew list "$package" &> /dev/null
    then
        echo "$package is already installed"
    else
        read -p "$package is not installed. Do you want to install $package? (y/n) " choice
        case "$choice" in
            y|Y )
                echo "Installing $package..."
                brew install "$package"
                ;;
            n|N ) echo "Skipping $package installation";;
            * ) echo "Invalid choice. Skipping $package installation";;
        esac
    fi
done
