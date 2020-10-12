export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here

# Adds `~/.local/bin/` and all subdirectories to $PATH
BIN_PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

mons --primary DP-0
mons -e right

export BROWSER="qutebrowser"
export TERMINAL="kitty"
export FILES="pcmanfm"
export EDITOR="code"

xset r rate 200 50

