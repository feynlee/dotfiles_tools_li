# dotfiles_tools_li

```bash
git clone git@github.com:feynlee/dotfiles_tools_li.git ~/Code/dotfiles/dotfiles_tools_li
# install vundle and all vim plugins
cd ~/Code/dotfiles/dotfiles_home
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
vim +PluginInstall +qall
stow -v -R -t ~ *
```
