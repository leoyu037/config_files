
if [ ! -d "~/.config/pip/" ] ; then
  mkdir -p ~/.config/pip/
fi

# Linux
cp jw.pip.conf ~/.config/pip/pip.conf

# OSX
cp jw.pip.conf ~/.pip/pip.conf
