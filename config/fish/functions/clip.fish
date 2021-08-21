function clip --wraps=xclip --description 'alias clip=xclip -sel c'
  xclip -sel c $argv
end