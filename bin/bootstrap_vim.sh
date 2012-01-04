# 
# Bootstraps vim modules undler ~/.vim/bundle
#

# Let's save the currrent path
MYOLDPW=`pwd`

# Let's find dotfiles directory
cd ~/.vim
cd `pwd -P`
cd ..

# Add submodules
git submodule add git://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive
git submodule add git://github.com/chrismetcalf/vim-conque.git vim/bundle/vim-conque
git submodule add https://github.com/mattn/gist-vim.git vim/bundle/gist-vim
git submodule add https://github.com/vim-scripts/mru.vim.git vim/bundle/mru.vim
git submodule add https://github.com/ervandew/supertab.git vim/bundle/supertab
git submodule add https://github.com/scrooloose/syntastic.git vim/bundle/syntastic
git submodule add https://github.com/tomtom/tcomment_vim.git vim/bundle/tcomment_vim
git submodule add https://github.com/tsaleh/vim-align.git vim/bundle/vim-align
git submodule add git://github.com/altercation/vim-colors-solarized.git vim/bundle/vim-colors-solarized
git submodule add git://github.com/tpope/vim-endwise.git vim/bundle/vim-endwise
git submodule add git://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive
git submodule add https://github.com/tpope/vim-git.git vim/bundle/vim-git
git submodule add https://github.com/edsono/vim-matchit.git vim/bundle/vim-matchit
git submodule add https://github.com/astashov/vim-ruby-debugger.git vim/bundle/vim-ruby-debugger
git submodule add https://github.com/tpope/vim-surround.git vim/bundle/vim-surround
git submodule add https://github.com/int3/vim-taglist-plus.git vim/bundle/vim-taglist-plus
git submodule add https://github.com/nelstrom/vim-textobj-rubyblock.git vim/bundle/vim-textobj-rubyblock
git submodule add https://github.com/kana/vim-textobj-user.git vim/bundle/vim-textobj-user
git submodule add git://github.com/vim-scripts/netrw.vim.git vim/bundle/netrw.vim
git submodule add git://github.com/tpope/vim-unimpaired.giti vim/bundle/vim-unimpaired
git submodule add git://github.com/xolox/vim-notes.git vim/bundle/vim-notes

# Init & update submodules
git submodule init

# Go back where we came from
cd $MYOLDPWD

