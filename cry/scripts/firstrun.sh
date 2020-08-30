#!/usr/bin/env bash
cver=$(jq -r '.cry[].version' ~/.cry/conf.json)
red='tput setaf 1'
nc='tput sgr0'
clear
echo Welcome to Cry $cver!
echo
echo Useful commands:
echo
echo \(Note\: On most keyboards, Super is the Windows Logo key\)
echo
echo $(tput setaf 1)Super+D$(tput sgr0) - execute progreams
echo $(tput setaf 1)uper+Shift+Q$(tput sgr0) - close selected window
echo $(tput setaf 1)Super+Enter$(tput sgr0) - start a terminal
echo $(tput setaf 1)Super+W$(tput sgr0) - set a wallpaper
echo $(tput setaf 1)Super+X$(tput sgr0) - lock the system
echo $(tput setaf 1)Super+Shift+X$(tput sgr0) - power menu
echo $(tput setaf 1)Super+H$(tput sgr0) - select window to the left of the current one
echo $(tput setaf 1)Super+L$(tput sgr0) - select window to the right of the current one
echo $(tput setaf 1)Super+J$(tput sgr0) - select window below the current one
echo $(tput setaf 1)Super+K$(tput sgr0) - select window above the current one
echo $(tput setaf 1)Super+Shift+H$(tput sgr0) - move the current window left relative to it\'s current position
echo $(tput setaf 1)Super+Shift+L$(tput sgr0) - move the current window right relative to it\'s its current position
echo $(tput setaf 1)Super+Shift+J$(tput sgr0) - move the current window down relative to it\'s current position
echo $(tput setaf 1)Super+Shift+K$(tput sgr0) - move the current window up relative to it\'s current position
echo $(tput setaf 1)Super+R$(tput sgr0) - toggle resize mode \(in resize mode, window movement hotkeys will change window size\)
echo $(tput setaf 1)Super+P$(tput sgr0) - toggle touchpad
echo $(tput setaf 1)Super+Z$(tput sgr0) - toggle compositor
echo $(tput setaf 1)Super+Shift+Space$(tput sgr0) - Toggle whether current window is floating or tiling
echo $(tput setaf 1)Super+Space$(tput sgr0) - Change which layer is being managed by your hotkeys \(tiled layer or floating layer.\)
echo $(tput setaf 1)Super+Shift+P$(tput sgr0) - Toggle polybar \(can also be used to restart it in case of issue.\)
echo $(tput setaf 1)Super+Shift+N$(tput sgr0) - Open network connection control
echo  
echo Note: The cryInstaller does not currently include any wallpapers.
echo Please place any wallpapers you want to use in ~/.wallpapers.
echo If this folder did not already exist, the cryInstaller will have created it for you.
echo
echo Press enter to close and disable this window.
echo \(It won\'t show up again\)
read
jq '.cry[].firstrun = "0"' ~/.cry/conf.json | sponge ~/.cry/conf.json
exit
