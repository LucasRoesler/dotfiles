function vscode --wraps=code --description='Visual Studio Code'
  code-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland $argv
end