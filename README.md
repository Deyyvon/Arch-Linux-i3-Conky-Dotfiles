# synack.d's GNU/Linux Dotfiles
This repository contains all of my dotfiles for various flavors of GNU/Linux. They have
corresponding [etcfiles](https://github.com/synackd/etcfiles). Each theme is located on
a different branch, with my current "daily driver" dotfiles located in
``sandbox/<hostname>``. Enjoy!

## Requirements
* [`yadm`](https://github.com/TheLocehiliosan/yadm)
    * This is only required if you want to track your dotfiles as they are, where they
    are. It can be used just like Git. See their setup instructions to get started.

## Installation
```bash
$ yadm clone https://github.com/synackd/dotfiles.git
$ yadm checkout <theme>
```
Where `<theme>` is the name of the branch where the desired theme resides.

## Themes
### cyber
A cyberpunk/synthwave theme.
![Screenshot](/screenshots/cyber.png?raw=true "cyber")

### basic
These were my first dotfiles when I first installed Arch. As the directory name states,
they are quite basic. Uses FontAwesome for the i3status bar.
![Screenshot](/screenshots/basic.png?raw=true "basic")

### powerline
This is the second go-around on the same laptop which uses i3blocks with a powerline theme.
![Screenshot](/screenshots/powerline.png?raw=true "powerline")
