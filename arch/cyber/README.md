## cyber: Arch + i3 + Polybar
# Necessities:
* pathogen
    * vim-airline
    * vim-airline-themes
* powerline
* RobotoMono Nerd Fonts
* zsh
    * antigen
    * powerlevel9k

# Optional:
* ``kalu`` - a script that notifies you of package updates and Arch news

# Notes:
* To get locking working with suspension, you need:
    * ``/usr/local/src/lock.sh``
    * ``/etc/systemd/system/suspend@.service``
        * Enable with `sudo systemctl enable suspend@<username>.service` where `<username>` is your user
