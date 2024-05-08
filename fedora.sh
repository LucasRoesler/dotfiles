sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo <<EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

dnf install
# basics
neovim \
    difftastic \
    rsync \
    powertop \
    jq
# media
playerctl
# shell
fish
# rust
just \
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
# docker
docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# google
google-cloud-cli

ln -sf $(which nvim) ~/.local/bin/vim
ln -sf $(which bat) ~/.local/bin/batcat

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

poetry self add poetry-dotenv-plugin
poetry config virtualenvs.in-project true
poetry config virtualenvs.prefer-active-python true

# configuration
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

k8s_version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${k8s_version}/bin/linux/amd64/kubectl.sha256"
curl -LO "https://dl.k8s.io/release/${k8s_version}/bin/linux/amd64/kubectl"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
if [ $? -eq 0 ]; then
    chmod +x kubectl
    mv kubectl ~/.local/bin/kubectl
    rm kubectl.sha256
fi

helm_version=$(curl -L -s https://github.com/helm/helm/releases/latest | grep -o -E "v[0-9]+\.[0-9]+\.[0-9]+" | head -1)
curl -LO "https://get.helm.sh/helm-${helm_version}-linux-amd64.tar.gz"
curl -LO "https://get.helm.sh/helm-${helm_version}-linux-amd64.tar.gz.sha256"

echo "$(cat helm-${helm_version}linux-amd64.tar.gz.sha256)  helm-${helm_version}linux-amd64.tar.gz" | sha256sum --check
if [ $? -eq 0 ]; then
    tar -xvf "helm-${helm_version}linux-amd64.tar.gz"
    chmod +x linux-amd64/helm
    mv linux-amd64/helm ~/.local/bin/helm
    rm -rf helm-${helm_version}linux-amd64.tar.gz linux-amd64 helm-${helm_version}linux-amd64.tar.gz.sha256
fi
