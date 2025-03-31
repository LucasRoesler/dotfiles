function _ls --description 'call eza when installed or ls when not'
    if command -v eza >/dev/null
        eza $argv
    else
        ls $argv
    end
end


function l --description 'list the directory'
    _ls -lhB --color=auto $argv
end

function ll --description 'list the directory and dotfiles'
    _ls -lhA --color=auto $argv
end
