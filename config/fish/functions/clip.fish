if [ "$XDG_SESSION_TYPE" = "wayland" ]
  function clip --wraps=wl-copy --description 'alias clip=wl-copy'
      wl-copy $argv
  end
  function pbpaste --wraps=wl-copy --description 'alias clip=wl-copy -o'
      wl-copy -o
  end
else
  function clip --wraps=xclip --description 'alias clip=xclip -sel c'
      xclip -sel c $argv
  end
  function pbpaste --wraps=xclip --description 'alias clip=xclip -o'
      xclip -sel c -o
  end
end

alias -s pbcopy "clip"
