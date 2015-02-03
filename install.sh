#!/bin/sh
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_jwh
############################

########## Variables

mypwd=$PWD
script_name=$(basename $BASH_SOURCE)
dot_dir=~/dotfiles_jwh    # dotfiles directory
olddir=~/dotfiles_old     # old dotfiles backup directory
dirs_list="bash vim"      # list of folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dot_dir directory"
cd $dot_dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
echo ""
for d in $dirs_list
do
  for file in "$dot_dir"/"$d"/*
  do
    mv -i ~/.${file##*/} $olddir
    echo "Creating symlink from $file to ${file##*/} in home directory."
    ln -s $file ~/.${file##*/}
  done
done
#for file in $files; do
#  echo "Moving any existing dotfiles from ~ to $olddir"
#  mv ~/.$file ~/dotfiles_old/
#  echo "Creating symlink to $file in home directory."
#  ln -s $dir/$file ~/.$file
#done

## symlink proper files for vim-latex
#echo "Creating symlinks for vim-latex"
#cd vim/vim/bundle/vim-latex/ftplugin
#ln -s -f ../../../aux/tex.vim tex.vim
#cd $mypwd
#cd vim/vim/bundle/vim-latex/ftplugin/latex-suite/templates
#ln -s -f ../../../../../aux/beamer_smu.tex beamer_smu.tex
#cd $mypwd
#echo "...done"
#
#echo "Compiling ctags for Taglist"
#cd vim/vim/ctags-5.8
#./configure --prefix=$HOME/.vim/ctags-5.8/build
#make install
#cd $mypwd
#echo "...done"
