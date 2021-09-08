#!/bin/bash

distrib=$(sudo cat /etc/os-release | sed -n 's/^ID=\(.*\)$/\1/p')
echo $distrib

if [[ $distrib = "ubuntu" ]]; then
    echo This use apt
    sudo apt install zsh
    sudo apt-get install python-pygments
elif [[ $distrib = "manjaro" ]]; then
    echo This use pacman
    sudo pacman -S --no-confirm zsh
    sudo pacman -S --no-confirm python-pygments
fi

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i -r 's+ZSH_THEME=".*"+ZSH_THEME="powerlevel10k/powerlevel10k"+g'  zsh/.zshrc
mv zsh/.zshrc $HOME
mv zsh/aliases.zsh $ZSH_CUSTOM
source .zshrc

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mkdir ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
fc-cache -f -v

p10k configure
