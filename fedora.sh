sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'

dnf install \
    # basics
    neovim
    difftastic
    rsync
    # media
    playerctl
    # shell
    fish
    # rust
    just
    rustup
    # python
    pipx
    openssl-devel
    gcc-c++
    zlib-devel
    sqlite-devel
    xz-devel
    libedit-devel
    bzip2-devel
    libffi-devel
    tk-devel
    readline-devel
    libarrow-devel
    python3-devel
    # auth
    1password
    1password-cli

# flatpak
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub io.bassi.Amberol
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub io.github.flattool.Warehouse
flatpak install flathub io.github.TransmissionRemoteGtk
flatpak install flathub com.slack.Slack
flatpak install flathub org.signal.Signal
flatpak install flathub com.github.eneshecan.WhatsAppForLinux
flatpak install flathub app.drey.Dialect
flatpak install flathub org.gnome.design.IconLibrary
flatpak install flathub dev.bragefuglseth.Fretboard

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale set --operator=$USER

curl https://pyenv.run | bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
bash ~/.fzf/install

pipx install poetry

poetry config virtualenvs.in-project true
poetry config virtualenvs.prefer-active-python true

# configuration
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"