#! bash
cat extensions.txt | xargs -n 1 code --install-extension
ln -sf $(pwd)/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
