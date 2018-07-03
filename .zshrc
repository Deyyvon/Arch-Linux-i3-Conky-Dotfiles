###################################################
# EXPORTS
###################################################
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib32:/opt/Xilinx/Vivado/2017.4/lib/lnx64.o:/opt/Xilinx/SDK/2017.4/bin/unwrapped/lnx64.o"
export PATH="${PATH}":"${LD_LIBRARY_PATH}"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d:'
zstyle ':completion:*' glob unset
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'Corrections: %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/devon/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Powerline installation:
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

##################################################
# POWERLEVEL9K CONFIGURATION
##################################################
# Stylizing the prompt:
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
#
# To see RGB color codes and what they look like, use the following in a ZSH shell:
# for code ({000..255}) print -P -- "$code: %F{$code}████████████████████████████████████████████%f"

#source ~/.config/zsh/powerlevel-9k/themes/regular.zsh
source ~/.config/zsh/powerlevel-9k/themes/cyberpunk.zsh
####### END POWERLEVEL9K CONFIG ##################

##################################################
# ANTIGEN PLUGINS
##################################################
# Use Antigen plugin manager.
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh	#(Already being used)

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# If X is running, use Powerline. Otherwise, use console-valid theme.
if [ -z ${DISPLAY+x} ]; then
	antigen theme gentoo
#	antigen apply
else
	# Load the theme.
	#antigen theme agnoster

	# Powerline fonts
	powerline-daemon -q
	source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

	# Enable Powerlevel9k ZSH Theme
	source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
fi

# Tell Antigen that you're done.
#antigen apply
############## END ANTIGEN PLUGINS #############

###############################################
# KEYBINDINGS
###############################################
# Create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Aliases
source ~/.zsh_aliases

##################################
# FUNCTIONS
##################################
# Coloured man pages using less as pager
man() {
    env \
	      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	      LESS_TERMCAP_md=$(printf "\e[1;31m") \
	      LESS_TERMCAP_me=$(printf "\e[0m") \
	      LESS_TERMCAP_se=$(printf "\e[0m") \
	      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	      LESS_TERMCAP_ue=$(printf "\e[0m") \
	      LESS_TERMCAP_us=$(printf "\e[1;32m") \
	      man "$@"
}

##################################
# AUTOMATICALLY RUN
##################################

# Make sure everything is applied.
antigen apply

# Some nice stats.
if [[ $(whoami | tr -d '\n') != 'root' ]]; then
	neofetch --colors 1 1 1 1 1 3 1 1
fi
