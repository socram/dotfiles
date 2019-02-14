INSTALL_DIR='/opt/dotfiles'

mkdir -p ${INSTALL_DIR} && cd ${INSTALL_DIR}

echo "Symlinking things:"

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# BINARIES
echo "Installing binaries:"

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

echo "Installing jabba"
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

echo "Done!"
