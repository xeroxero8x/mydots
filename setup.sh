#!/usr/bin/env bash

#Cloning repo
git clone --depth=1 https://github.com/xeroxero8x/mydots.git ~/mydots/

#Installing packages
#
#Install paru
git clone https://aur.archlinux.org/paru.git

cd ~/paru/

makepkg -si

#Moving into mydots
cd ~/mydots/

# Check if packages.txt file exists
if [ ! -f "packages.txt" ]; then
	echo "Error: packages.txt file not found."
	exit 1
fi

# Read packages.txt line by line
while IFS= read -r package; do
	# Check if line is "end", then stop
	if [ "$package" = "end" ]; then
		echo "Reached end of packages list."
		break
	fi

	# Install package using paru
	echo "Installing package: $package"
	paru -S --noconfirm "$package"
done <"packages.txt"

#Moving to $Home Directory
cd ~

#Cloning Hyprdots repo
git clone https://github.com/prasanthrangan/hyprdots.git --depth=1

cd ~/Hyprdots/Scripts/

./install.sh