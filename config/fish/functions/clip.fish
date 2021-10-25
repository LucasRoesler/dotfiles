if [ "$XDG_SESSION_TYPE" = "wayland" ]
  function clip --wraps=wl-copy --description 'alias clip=wl-copy'
      wl-copy $argv
  end
else
  function clip --wraps=xclip --description 'alias clip=xclip -sel c'
      xclip -sel c $argv
  end
end