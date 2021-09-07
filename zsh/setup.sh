#!/bin/bash

distrib=$(sudo cat /etc/os-release | sed -n 's/^ID=\(.*\)$/\1/p')
echo $distrib

if [[ $distrib = "ubuntu" ]]; then
    echo This use apt
    sudo apt-get install python-pygments
elif [[ $distrib = "arch-linux" ]]; then
    echo This use pacman
    sudo pacman -S --no-confirm python-pygments
fi
