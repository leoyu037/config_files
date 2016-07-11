cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
cp -r vim ~/.vim
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc

. ~/.zshrc

# Make temp directory for vim backup/swap files
if [ ! -d ~/.tmp/ ]; then
  mkdir ~/.tmp/
fi
