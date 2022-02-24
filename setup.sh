
# configure git
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no


# install basic packages
yay -S vim kitty i3-gaps i3lock rofi polybar feh picom dunst xss-lock dex lightdm lightdm-slick-greeter numlockx ttf-iosevka-nerd thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin file-roller

# install basic programs
yay -S google-chrome

# copy lightdm files
sudo cp ~/.lightdm/* /etc/lightdm/

# configure git authetication
## generate ssh key
ssh-keygen -t ed25519 -C "andre7391@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

## recover ssh key for git
git init --bare $HOME/.myconf
