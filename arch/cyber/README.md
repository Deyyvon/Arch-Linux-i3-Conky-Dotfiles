## cyber: Arch + i3 + Polybar
# Necessities:
* pathogen
    * vim-airline
    * vim-airline-themes
* powerline
* nerdfonts
* zsh
    * antigen
    * powerlevel9k

# Notes
* To get locking working with suspension, you need:
    * /usr/local/src/lock.sh
    * /etc/systemd/system/suspend@.service (enable with `sudo systemctl enable suspend@devon.service`)
