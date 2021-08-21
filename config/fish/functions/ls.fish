function l --description 'list the directory'
  ls -lhB --color=auto $argv
end

function ll --description 'list the directory and dotfiles'
  ls -lhA --color=auto $argv
end