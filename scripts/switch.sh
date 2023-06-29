#!/bin/bash
switch_default () {
  rm -f ~/.config/nvim/init.lua
  echo "-- Input \"gf\" in normal mode to jump to configuration." >>~/.config/nvim/init.lua
  echo "-- ~/.config/nvim/lua/bin/" >>~/.config/nvim/init.lua
  echo "require(\"bin\").setup()" >>~/.config/nvim/init.lua
}

switch_user () {
  rm -f ~/.config/nvim/init.lua
  echo "-- Input \"gf\" in normal mode to jump to configuration." >>~/.config/nvim/init.lua
  echo "-- ~/.config/nvim/lua/user/" >>~/.config/nvim/init.lua
  echo "require(\"user\").setup()" >>~/.config/nvim/init.lua
}

echo "Switch to user config or default config"
read -rp "[u/d]" switch
case "$switch" in
  u)
    switch_user
    ;;
  d)
    switch_default
    ;;
esac
