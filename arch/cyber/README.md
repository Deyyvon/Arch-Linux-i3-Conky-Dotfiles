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
    * ``/usr/local/src/lock.sh``
    * ``/etc/systemd/system/suspend@.service``
        * Enable with `sudo systemctl enable suspend@<username>.service` where `<username>` is your user
