#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY='.config'

echo 'link home directory dotfiles'
cd "${DOT_DIRECTORY}"
for f in .??*
do
  #無視したいファイルやディレクトリ
  [ "$f" = ".DS_Store" ] && continue
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".config" ] && continue
  # ln -snfv "${DOT_DIRECTORY}"/"${f}" "${HOME}"/"${f}"
  echo "ln -snfv "${DOT_DIRECTORY}"/"${f}" "${HOME}"/"${f}""
done

echo "link .config directory dotfiles"
cd "${DOT_DIRECTORY}"/"${DOT_CONFIG_DIRECTORY}"
for f in ??*
do
  # ln -snfv "${DOT_DIRECTORY}"/"${DOT_CONFIG_DIRECTORY}"/"${f}" "${HOME}"/"${DOT_CONFIG_DIRECTORY}"/"${f}"
  echo "ln -snfv "${DOT_DIRECTORY}"/"${DOT_CONFIG_DIRECTORY}"/"${f}" "${HOME}"/"${DOT_CONFIG_DIRECTORY}"/"${f}""
done

echo "linked dotfiles complete!"
