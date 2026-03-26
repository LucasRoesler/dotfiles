function vscode --wraps=code --description='Visual Studio Code'
  code --enable-features=UseOzonePlatform --ozone-platform=wayland $argv
end