REPO_ROOT="`git rev-parse --show-toplevel`"
pushd "$REPO_ROOT"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Shell
echo Configuring shells
cp commonrc ~/.commonrc
cp zshrc ~/.zshrc
cp bashrc ~/.bashrc
cp bash_prompt ~/.bash_prompt

# Vim
echo Configuring vim
cp -r vim ~/.vim
cp vimrc ~/.vimrc
# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# Make temp directory for vim backup/swap files
if [ ! -d "~/.tmp/" ]; then
  mkdir ~/.tmp/
fi

# Tmux
cp tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Configuring other stuff...
cp gitconfig ~/.gitconfig

source ~/.zshrc
popd
