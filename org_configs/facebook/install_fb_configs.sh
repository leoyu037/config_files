REPO_ROOT="`git rev-parse --show-toplevel`"
pushd "$REPO_ROOT/org_configs_facebook"

source "$REPO_ROOT/install_configs.sh"

# Shell
cp fb_config_leo ~/.fb_config_leo

# Vim
echo Configuring vim for FB
cp vimrc ~/.vimrc
cp ctags ~/.ctags
vim +PluginInstall +qall

source ~/.zshrc
popd
