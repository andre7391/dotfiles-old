
# configure git
#    git clone --bare git@github.com:andre7391/dotfiles.git $HOME/.dotfiles
#    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#    dotfiles config status.showUntrackedFiles no
#    dotfiles checkout

# install packages
    # basic
    yay -S vim kitty i3-gaps i3lock rofi polybar feh picom dunst xss-lock dex lightdm lightdm-slick-greeter numlockx ttf-iosevka-nerd thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin file-roller

    # programs
    yay -S google-chrome visual-studio-code-bin

# configure git authetication
    ## generate ssh key
    #ssh-keygen -t ed25519 -C "andre7391@gmail.com"
    #eval "$(ssh-agent -s)"
    #ssh-add $HOME/.ssh/id_ed25519

    ## recover ssh key for git
    #cat $HOME/.ssh/id_ed25519.pub

# dracula theme
    mkdir /tmp/dracula
    cd /tmp/dracula

    # theme
    wget https://github.com/dracula/gtk/archive/master.zip
    unzip master.zip
    sudo mv /tmp/dracula/gtk-master /usr/share/themes/Dracula
    sudo chown -R root:root /usr/share/themes/Dracula

    # icon theme
    wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
    unzip Dracula.zip
    sudo mv /tmp/dracula/Dracula /usr/share/icons/Dracula
    sudo chown -R root:root /usr/share/icons/Dracula

    # cursors
    sudo cp -R /usr/share/themes/Dracula/kde/cursors/Dracula-cursors/ /usr/share/icons/Dracula-Cursors

    # wallpaper
    sudo cp $HOME/.wallpapers/sunset_1920x1080.png /usr/share/pixmaps/wallpaper.png
    sudo chown -R root:root /usr/share/pixmaps/wallpaper.png

# system files
    # lightdm
    sudo cp $HOME/.system/lightdm/lightdm.conf /etc/lightdm/
    sudo cp $HOME/.system/lightdm/slick-greeter.conf /etc/lightdm/
    sudo chown -R root:root /usr/share/icons/Dracula

    sudo cp $HOME/.system/lightdm/index.theme /usr/share/icons/default/index.theme
    sudo chown -R root:root /usr/share/icons/default/index.theme

    # enviroment
    sudo cp $HOME/.system/etc/environment /etc/environment
    sudo chown -R root:root /etc/environment

    # fonts
    sudo cp $HOME/.system/fonts/feather.ttf /usr/share/fonts/
    sudo chown -R root:root /usr/share/fonts/feather.ttf
    fc-cache -f -v

# correct dual boot time
    timedatectl set-local-rtc 1

# enable ligthdm
    sudo systemctl enable lightdm
