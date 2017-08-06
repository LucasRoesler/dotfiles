
echo "XCode command line tools"
xcode-select --install

echo "General settings"
sudo chflags hidden /Applications/maps.app
sudo chflags hidden /Applications/game\ center.app
sudo chflags hidden /Applications/photo\ booth.app

echo "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock\n"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "System - Require password immediately after sleep or screen saver begins\n"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes\n"
defaults write com.apple.BezelServices kDimTime -int 300

echo "Bluetooth - Increase sound quality for headphones/headsets\n"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Finder - Default location is HOME"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

echo "Finder - Show the $HOME/Library folder\n"
sudo chflags nohidden $HOME/Library

echo "Finder - Show hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


echo "Finder - Show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder - Show status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder - Display full POSIX path as window title\n"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


echo "Printer - Expand print panel by default\n"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Disable Photos.app from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


echo "Enabled tab in modal dialogs (default: 0)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

echo "Stop launching itunes via media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

echo "Installing Homebrew"
ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/bin:$PATH"

echo "Brew installing apps"
brew install automake
brew install autoconf
brew install awscli
brew install wget
brew install neovim
brew install vim
brew install git
brew install node
brew install npm
brew install python
brew install python3
brew install curl
brew install libevent
brew install openssl
brew install readline
brew install git-open
brew install git-extras
brew install zsh
brew install docker
brew install hugo
brew install ssh-copy-id
brew install golang
brew install ruby
brew install go-delve/delve/delve
brew install cmake
brew install rust

echo "Cask installing apps"
brew cask install iterm2
brew cask install keybase
brew cask install keepingyouawake
brew cask install mattr-slate
brew cask install caskroom/versions/google-chrome-beta
brew cask install virtualbox
brew cask install sublime-text
brew cask install whatsapp

echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Install miniconda"
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3

echo "Install gems"
gem install mdless

echo "Setup dotfiles"
ln -sf $(pwd)/aliases $HOME/.aliases
ln -sf $(pwd)/mac $HOME/.mac
ln -sf $(pwd)/slate $HOME/.slate
ln -sf $(pwd)/bashrc $HOME/.bashrc
ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/gitconfig $HOME/.gitconfig
ln -sf $(pwd)/gitmessage $HOME/.gitmessage
ln -sf $(pwd)/package_control.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -sf $(pwd)/user_settings.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -sf $(pwd)/sublime_keybindings.sublime-keymap $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap

echo "Setup code folder"
mkdir $HOME/Code

echo "Installing Inconsolata font"
curl -sfSL -o $HOME/Library/Fonts/Inconsolata.otf http://levien.com/type/myfonts/Inconsolata.otf
