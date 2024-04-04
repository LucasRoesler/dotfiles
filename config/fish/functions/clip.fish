if test "$XDG_SESSION_TYPE" = wayland
    function clip --wraps=wl-copy --description 'alias clip=wl-copy'
        wl-copy $argv
    end
    function pbpaste --wraps=wl-copy --description 'alias pbpaste=wl-copy -o'
        wl-copy -o
    end
else
    function clip --wraps=xclip --description 'alias clip=xclip -sel c'
        xclip -sel clip $argv
    end
    function pbpaste --wraps=xclip --description 'alias pbpaste=xclip -o'
        xclip -sel clip -o
    end
end
