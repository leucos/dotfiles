# Bootstraps vim modules undler ~/.vim/bundle
#

[ -d ~/.vim/backup ] || mkdir ~/.vim/backup
# Let's save the currrent path
MYOLDPW=`pwd`

# Let's find dotfiles directory
cd ~/.vim
cd `pwd -P`
cd ../..

# Add submodules
git submodule add git://github.com/tpope/vim-fugitive.git files/vim/bundle/vim-fugitive
git submodule add git://github.com/chrismetcalf/vim-conque.git files/vim/bundle/vim-conque
git submodule add https://github.com/mattn/gist-vim.git files/vim/bundle/gist-vim
git submodule add https://github.com/vim-scripts/mru.vim.git files/vim/bundle/mru.vim
git submodule add https://github.com/ervandew/supertab.git files/vim/bundle/supertab
git submodule add https://github.com/scrooloose/syntastic.git files/vim/bundle/syntastic
git submodule add https://github.com/tomtom/tcomment_vim.git files/vim/bundle/tcomment_vim
git submodule add https://github.com/tsaleh/vim-align.git files/vim/bundle/vim-align
git submodule add git://github.com/altercation/vim-colors-solarized.git files/vim/bundle/vim-colors-solarized
git submodule add git://github.com/tpope/vim-endwise.git files/vim/bundle/vim-endwise
git submodule add https://github.com/tpope/vim-git.git files/vim/bundle/vim-git
git submodule add https://github.com/edsono/vim-matchit.git files/vim/bundle/vim-matchit
git submodule add https://github.com/tpope/vim-surround.git files/vim/bundle/vim-surround
git submodule add https://github.com/int3/vim-taglist-plus.git files/vim/bundle/vim-taglist-plus
git submodule add https://github.com/nelstrom/vim-textobj-rubyblock.git files/vim/bundle/vim-textobj-rubyblock
git submodule add https://github.com/kana/vim-textobj-user.git files/vim/bundle/vim-textobj-user
git submodule add git://github.com/vim-scripts/netrw.vim.git files/vim/bundle/netrw.vim
git submodule add git://github.com/tpope/vim-unimpaired.git files/vim/bundle/vim-unimpaired
git submodule add git://github.com/xolox/vim-notes.git files/vim/bundle/vim-notes
git submodule add https://github.com/wincent/Command-T.git files/vim/bundle/command-t
git submodule add https://github.com/YorickPeterse/Autumn.vim.git files/vim/bundle/autumn.vim
git submodule add https://github.com/kchmck/vim-coffee-script.git files/vim/bundle/vim-coffee-script
git submodule add https://github.com/tomtom/tcalc_vim.git files/vim/bundle/tcalc_vim
git submodule add https://github.com/mrtazz/simplenote.vim.git files/vim/bundle/simplenote
git submodule add git://github.com/nathanaelkane/vim-indent-guides.git files/vim/bundle/vim-indent-guides

# Init & update submodules
git submodule init
git submodule update

# Updating modules
# for i in files/vim/bundle/*; do cd $i; git pull origin master; cd -; done

# Go back where we came from
cd $MYOLDPWD


