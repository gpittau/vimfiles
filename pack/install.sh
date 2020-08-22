#!/usr/bin/env bash
# This file lives in ~/.vim/pack/install.sh
# Remember to add executable: chmod +x ~/.vim/pack/install.sh
#
# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}
# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}
(
set_group syntax
package git://github.com/neoclide/coc.nvim.git &
package git://github.com/bling/vim-airline.git &
package git://github.com/kchmck/vim-coffee-script.git &
package git://github.com/itspriddle/vim-jquery.git &
package git://github.com/othree/html5.vim.git &
package git://github.com/tpope/vim-markdown.git &
package git://github.com/tomlion/vim-solidity.git &
package git://github.com/MaxMEllon/vim-jsx-pretty.git &
package git://github.com/jparise/vim-graphql.git &
wait
) &
(
set_group util
package git://github.com/sjl/gundo.vim.git &
package git://github.com/chrismetcalf/vim-yankring.git &
package git://github.com/mattn/webapi-vim.git &
package git://github.com/rking/ag.vim.git &
package git://github.com/tpope/vim-surround.git &
package git://github.com/scrooloose/nerdtree.git &
package git://github.com/scrooloose/nerdcommenter.git &
package git://github.com/ciaranm/securemodelines.git &
package git://github.com/tpope/vim-fugitive.git &
package git://github.com/tpope/vim-git.git &
package git://github.com/mattn/gist-vim.git &
wait
) &
(
set_group colorschemes
package git://github.com/tpope/vim-vividchalk.git &
package git://github.com/goatslacker/mango.vim.git &
package https://github.com/altercation/vim-colors-solarized.git &
wait
) &
wait
