<div align="center">

# \_Space-Nvim

<a href='https://postimg.cc/QKgRcR6R' target='_blank'><img src='https://i.postimg.cc/QKgRcR6R/IMG-20230501-192206.jpg' border='0' alt='IMG-20230501-192206'/></a>

### 此 space-nvim 非彼 spacevim

</div>

- Easy to use!
- Easy to setup!
- Easy to change config!
- Easy to install lsp-config!
- 60+ plugins support!

# 📡 Dependencies

## Main

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)  
`>= 0.83`  
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)  
`>= 20.2.9`  
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)  
`>= 2.41.0`  
![CMake](https://img.shields.io/badge/CMake-%23008FBA.svg?style=for-the-badge&logo=cmake&logoColor=white)  
`>= 3.26.4`  

**You can use your linux package manager to install it.**  
**For example:`pacman`,`pkg`,`apt`,`dnf` and so on.**  

## 🎉 Feature
make file:(Not gcc,shell script.)  
*Commands:*  
`make run`:Run sync plugins.  
`make update`:Update your github repo.  
`make debug`:Debug your code.  

## 📖 Language Support

![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![C](https://img.shields.io/badge/c-%2300599C.svg?style=for-the-badge&logo=c&logoColor=white)

## 💻 Setup

```sh
# Backup your config and remove your caches.
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/

# Clone the repo and change the links.
git clone --depth=1 https://ay1.us/https://github.com/the-essence-of-life/space-nvim/ ~/.config/nvim/
ln -s ~/.config/nvim/lua/bin/plugins/ ~/.config/nvim/lua/plugins/

# Finally,start your neovim!
nvim
```

## 📁 File directory

```
 .
├──  init.lua
├──  lazy-lock.json
├──  LICENSE
├──  lua
│  ├──  bin
│  │  ├──  config
│  │  │  ├──  autocmds.lua
│  │  │  ├──  keymaps.lua
│  │  │  ├──  lazy.lua
│  │  │  └──  options.lua
│  │  └──  plugins
│  │     ├──  lsp
│  │     │  └──  lsp*.lua
│  │     ├──  lsp.lua
│  │     ├──  tools
│  │     │  └──  tools*.lua
│  │     ├──  tools.lua
│  │     ├──  ui
│  │     │  └──  ui*.lua
│  │     ├──  ui.lua
│  │     ├──  user
│  │     ├──  user.lua
│  │     ├──  utils
│  │     │  └──  utils*.lua
│  │     └──  utils.lua
│  ├──  test.lua
│  └──  user
│     └──  init.lua
└──  README.md
```

## 📋 Plugins List

<details>
<summary>Cilck it!</summary>

- Comment.nvim
- alpha-nvim
- autoclose.nvim
- barbar.nvim
- ccc.nvim
- cmp-buffer
- cmp-cmdline
- cmp-nvim-lsp
- cmp-path
- cmp-vsnip
- dressing.nvim
- everforest-nvim
- gitsigns.nvim
- heirline.nvim
- hop.nvim
- icon-picker.nvim
- indent-blankline.nvim
- lazy.nvim
- lspkind.nvim
- lspsaga.nvim
- markdown-preview.nvim
- mason-lspconfig.nvim
- mason-null-ls.nvim
- mason-nvim-dap.nvim
- mason.nvim
- neodev.nvim
- noice.nvim
- nui.nvim
- null-ls.nvim
- nvim-cmp
- nvim-dap
- nvim-dap-ui
- nvim-lspconfig
- nvim-markdown
- nvim-material-icon
- nvim-notify
- nvim-spectre
- nvim-tree.lua
- nvim-treesitter
- nvim-ts-autotag
- nvim-ts-rainbow2
- nvim-ufo
- nvim-web-devicons
- overseer.nvim
- persistence.nvim
- plenary.nvim
- promise-async
- rust-tools.nvim
- sqlite.lua
- telescope-command-palette.nvim
- telescope-file-browser.nvim
- telescope-frecency.nvim
- telescope-menu.nvim
- telescope.nvim
- todo-comments.nvim
- toggleterm.nvim
- catppuccin.nvim
- tokyonight.nvim
- trouble.nvim
- vim-vsnip
</details>
<details>
<summary>Cilck it to learn more about lua grammer.</summary>

lua **[introduce](https://www.runoob.com/lua/lua-tutorial.html)**

</details>

# 🔧 Plugin Install & Setup

```lua
-- https://ay1.us/https://github.com/folke/lazy.nvim#examples
-- First, cd ~/.config/nvim/lua/bin/plugins/
  -- touch <your-file-name>.lua, e.g.:user.lua
-- Then copy these code to <your-file-name>.lua(run:nvim user.lua)
  -- i to insert,<Esc> can quit the insert mode.
  -- Then :wq to save the files.
  -- Finally,nvim user.lua again,you'll find these packages are auto installed.

  return {
    -- NOTE:Packer on 'requires' function are change on 'dependencies'.
      "foo/bar",
      dependencies = {},
      -- [event,ft,keys,cmd] are lazy-loading.
        event = "VeryLazy",
      -- [config,init,cond] are configruation.
        config = function()
        end,
  }
```

# 👋 THANKS SO

> All people helps me.  
> 所有帮助过我的人  
> No need money!用爱发电!
