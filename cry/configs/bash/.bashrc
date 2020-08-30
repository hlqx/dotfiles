
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
shopt -s autocd
shopt -s cdspell

# check if we're in a tty
inTTY=0
tty | grep tty &> /dev/null && inTTY=1

# display battery in prompt if on tty
if [ "$inTTY" = 0 ]; then
	export PS1="\[\033[38;5;1m\]λ\[$(tput sgr0)\] \$\[$(tput sgr0)\] "
else
	active_prompt() {
		PS1=" \[\033[38;5;1m\][$(acpi | head -n1 | cut -d ' ' -f 4 | cut -d ',' -f 1)]\[$(tput sgr0)\] \$\[$(tput sgr0)\] "
	}
	PROMPT_COMMAND=active_prompt
fi

# Set aliases
	# Package Manager
		alias "p"="sudo pacman"
		alias "pacinst"="sudo pacman -S"
		alias "pacs"="pacman -Ss"
		alias "pacq"="pacman -Q | grep -i"
		alias "pacf"="pacman -F"
		alias "syu"="sudo pacman -Syu"
		alias "syu-deep"="sudo pacman -Syy && sudo pacman -Su && sudo pacman -Fyy"
		alias "pacrm"="sudo pacman -R"
	
	# Media
		alias "ytdl"="youtube-dl"
	# Configuration
	
		alias "termconf"="vim ~/.config/termite/config"
		alias "bashconf"="vim ~/.bashrc"
		alias "zathuraconf"="vim ~/.config/zathura/zathurarc"
		alias "pacconf"="sudo vim /etc/pacman.conf"
		alias "i3conf"="vim ~/.config/i3/config"
		alias "polyconf"="vim ~/.config/polybar/config"

	# Directories

		alias "l"="ls"
		alias "sl"="ls"
		alias "ll"="ls -la"
		alias "la"="ls -a"
		alias "lsa"="ls -a"
	
	# Misc

		alias "v"="vim"
		alias "shred"="shred -n 16 -u -z"
		alias "floodgap"="lynx gopher://gopher.floodgap.com"
		alias "ls"="ls --color"

	# Xorg
		alias "x"="startx &> /dev/null"
	# Neofetch
		alias "neofetch"="echo && neofetch"
	# NVIM -> VIM
		alias "vim"="nvim"

. .profile
