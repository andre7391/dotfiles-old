
# git clone
    git clone --bare https://github.com/andre7391/dotfiles.git $HOME/.dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no
    dotfiles checkout
    read -n 1 -p "press any key to continue!"

    # change repository to ssh 
    # url = git@github.com:andre7391/dotfiles.git
	# fetch = +refs/heads/*:refs/remotes/origin/*

# install
    # packages
    yay -S vim kitty i3-gaps i3lock rofi polybar feh picom dunst xss-lock dex lightdm lightdm-slick-greeter numlockx ttf-iosevka-nerd nemo mesa
    read -n 1 -p "press any key to continue!"

    # programs
    yay -S google-chrome visual-studio-code-bin
    read -n 1 -p "press any key to continue!"

# ssh key
    ## generate ssh key
    ssh-keygen -t ed25519 -C "andre7391@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add $HOME/.ssh/id_ed25519

    ## recover ssh key for git
    cat $HOME/.ssh/id_ed25519.pub
    read -n 1 -p "press any key to continue!"
   

# dracula theme
    mkdir /tmp/dracula
    cd /tmp/dracula

    # theme
    wget https://github.com/dracula/gtk/archive/master.zip
    unzip master.zip
    sudo mv /tmp/dracula/gtk-master /usr/share/themes/Dracula
    sudo chown -R root:root /usr/share/themes/Dracula
    sudo cp -R /usr/share/themes/Dracula/kde/cursors/Dracula-cursors/ /usr/share/icons/Dracula-Cursors
    read -n 1 -p "press any key to continue!"

    # icon theme
    wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
    unzip Dracula.zip
    sudo mv /tmp/dracula/Dracula /usr/share/icons/Dracula
    sudo chown -R root:root /usr/share/icons/Dracula
    read -n 1 -p "press any key to continue!"


    # wallpaper
    sudo cp $HOME/.wallpapers/sunset_1920x1080.png /usr/share/pixmaps/wallpaper.png
    sudo chown -R root:root /usr/share/pixmaps/wallpaper.png
    read -n 1 -p "press any key to continue!"

# system files
    # lightdm
    sudo cp $HOME/.system/lightdm/lightdm.conf /etc/lightdm/
    sudo cp $HOME/.system/lightdm/slick-greeter.conf /etc/lightdm/
    sudo chown -R root:root /usr/share/icons/Dracula

    sudo cp $HOME/.system/lightdm/index.theme /usr/share/icons/default/index.theme
    sudo chown -R root:root /usr/share/icons/default/index.theme
    read -n 1 -p "press any key to continue!"

    # enviroment
    sudo cp $HOME/.system/etc/environment /etc/environment
    sudo chown -R root:root /etc/environment
    read -n 1 -p "press any key to continue!"

    # fonts
    sudo cp $HOME/.system/fonts/feather.ttf /usr/share/fonts/
    sudo chown -R root:root /usr/share/fonts/feather.ttf
    fc-cache -f -v
    read -n 1 -p "press any key to continue!"

# correct dual boot time
    timedatectl set-local-rtc 1
    read -n 1 -p "press any key to continue!"

# enable ligthdm
    sudo systemctl enable lightdm
    read -n 1 -p "press any key to continue!"
