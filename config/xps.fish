export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="nvim"

if [ "$XDG_SESSION_TYPE" != "wayland" ]
    setxkbmap -option caps:escape
end
