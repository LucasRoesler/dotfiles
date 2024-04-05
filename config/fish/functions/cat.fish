if command -q batcat
    function cat --wraps=batcat --description 'alias cat=bat'
        bat $argv
    end
else
    function cat --wraps=bat --description 'alias cat=bat'
        bat $argv
    end
end
