# dotfiles

## Note:
These are quite old, and some things are broken. I don't update them much because I haven't used i3 in a while. Currently using GNOME (I'm sorry please don't throw anything at me) but I mean to fix them, and hopefully make them less scuffed, sometime soon. Also there is an install script floating around somewhere but I don't know where it is so oh well.

Install guide:
- Place cry/ in your $HOME, as .cry
- Go into ~/.cry/configs (you might want to go into all the subfolders and make sure no files will conflict with ones you already have)
- Run stow * --target $HOME
- Chuck any wallpapers you want to use into $HOME/.wallpapers (or just symlink /usr/share/backgrounds or wherever you keep them to it)
- Start i3 through whatever method you normally do
- Press MOD+W to open the wallpaper changer

Required/recommended packages: (using archlinux package names)
- i3-gaps
- polybar
- picom (the compositor can be changed by changing services[].compositor[].command in ~/.cry/conf.json with your text editor of choice)
- zathura (for pdfman.sh, don't think it's used anywhere else. Should definitely make this a configurable option)
- dunst
- terminus-font-otb
- terminus-font (not sure if this one is *actually* required, I don't remember)
- vim (optional)
- termite
- bash
- rofi
- moreutils (specifically, sponge)
- feh

that should be it, but i might have forgot some. (i will update this readme at some point)

Less important notes:
- these were never really finished tbh
- pretty sure dunst is very unfinished
