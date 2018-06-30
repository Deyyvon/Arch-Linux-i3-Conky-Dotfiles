# cyber
A cyberpunk/synthwave theme.

![Screenshot](/screenshots/cyber.png?raw=true "cyber")

## Necessities:
* [`i3`](https://github.com/i3/i3)
* [`i3lock`](https://github.com/i3/i3lock) - an improved screen locker
* [`xautolock`](https://github.com/l0b0/xautolock) - lock after idle time
* [`polybar`](https://github.com/jaagr/polybar)
* [`vim-pathogen`](https://github.com/tpope/vim-pathogen)
    * [`vim-airline`](https://github.com/vim-airline/vim-airline)
    * [`vim-airline-themes`](https://github.com/vim-airline/vim-airline-themes)
* [`powerline`](https://github.com/powerline/fonts)
* [RobotoMono Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
* [`zsh`](http://www.zsh.org/)
    * [`antigen`](https://github.com/zsh-users/antigen)
    * [`powerlevel9k`](https://github.com/bhilburn/powerlevel9k)
* [Breeze-Hacked](https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/) - a h4x0r cursor theme
* [`feh`](https://feh.finalrewind.org/) - an image viewer used to set the wallpaper
* [`kalu`](https://jjacky.com/kalu/) - a script that notifies you of package updates and Arch news
* [`i3-gaps`](https://github.com/Airblader/i3) - gaps between windows; replaces `i3`
* [`ranger`](https://github.com/ranger/ranger) - a terminal file explorer
    * [`ranger-devicons`](https://github.com/alexanderjeurissen/ranger_devicons) - file icons for ranger
* [`rofi`](https://github.com/DaveDavenport/rofi) - a handy program starter

## Notes:
* To get locking working with suspension using Systemd, you need:
    * ``~/.scripts/lock.sh``
    * ``/etc/systemd/system/suspend@.service``
        * Enable with `sudo systemctl enable suspend@<username>.service` where `<username>` is your user
```systemd
#suspend@.service
[Unit]
Description=Lock the screen on resume from suspend
Before=sleep.target

[Service]
User=%I
Type=forking
Environment=DISPLAY=:0
ExecStart=-/usr/bin/xautolock -locknow
ExecStartPost=/usr/bin/sleep 3

[Install]
WantedBy=sleep.target
```
