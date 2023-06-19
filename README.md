<div align="center">

# \_Space-Nvim

<a href='https://postimg.cc/QKgRcR6R' target='_blank'><img src='https://i.postimg.cc/QKgRcR6R/IMG-20230501-192206.jpg' border='0' alt='IMG-20230501-192206'/></a>

### 此 space-nvim 非彼 spacevim

</div>

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

---

## 🎉 Feature

make file:(Not gcc,shell script.)  
+ `make sync`:Sync the latest plugins(Ensure that the network is smooth).  
+ `make update`:Update to latest config.  
+ `make debug`:Debug your neovim(Only applicable to versions above 10.0).
+ `make rec`:Delete your all neovim config.(Use with caution)
+ `make set-options`:Quick switch the config directory.
+ `make add-plugins`:Quick switch the plugins directory.

---

## 📡 Dependencies

<!-- ![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)   -->
<!-- `>= 0.83`   -->
<!-- ![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)   -->
<!-- `>= 20.2.9`   -->
<!-- ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)   -->
<!-- `>= 2.41.0`   -->
<!-- ![CMake](https://img.shields.io/badge/CMake-%23008FBA.svg?style=for-the-badge&logo=cmake&logoColor=white)   -->
<!-- `>= 3.26.4` -->

**Must:**  
&ensp;&ensp;`nerdfont`(To show the icons.)  
&ensp;&ensp;`neovim` >= `0.10.0`  
&ensp;&ensp;*Comment:* In the future, version 0.83 will be adapted.  
&ensp;&ensp;`git` >= `2.41.0`  
&ensp;&ensp;`clang(treesitter need)` >= `3.26.4`  
&ensp;&ensp;`nodejs(mason need)` >= `19.*`

**Oprional:**  
&ensp;&ensp;`fd` >= `8.7.0`  
&ensp;&ensp;`rg(ripgrep)` >= `8.7.0`

**You can use linux package manager to install it.**  
**For example:`pacman`,`pkg`,`apt`,`dnf` and so on.**

---

## 📖 Language Support

+ Front-end full Language
+ C-family full Language  
> NOTE:To support it,you'll copy these code to your neovim configruation.  
```lua
-- ~/.config/nvim/lua/bin/plugins/lsp/lsp-settings.lua
require("lspconfig").clangd.setup{}

```
+ Lua(needs to install `lua-language-server` in your terminal.)

---

## 💻 Setup

```sh
# Backup your config and remove your caches.
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/

# Clone the repo and change the links.
git clone --depth=1 https://github.com/the-essence-of-life/space-nvim/ ~/.config/nvim/
ln -s ~/.config/nvim/lua/bin/plugins/ ~/.config/nvim/lua/plugins/

# Finally,start your neovim!
nvim
```

---

## 📁 File directory

```
 .
├─  init.lua
├─  lazy-lock.json
├─  LICENSE
├─  lua
│ ├─  bin
│ │ ├─  config
│ │ │ ├─  autocmds.lua
│ │ │ ├─  keymaps.lua
│ │ │ ├─  lazy.lua
│ │ │ └─  options.lua
│ │ └─  plugins
│ │    ├─  lsp
│ │    │ └─  lsp*.lua
│ │    ├─  lsp.lua
│ │    ├─  tools
│ │    │ └─  tools*.lua
│ │    ├─  tools.lua
│ │    ├─  ui
│ │    │ └─  ui*.lua
│ │    ├─  ui.lua
│ │    ├─  user
│ │    ├─  user.lua
│ │    ├─  utils
│ │    │ └─  utils*.lua
│ │    └─  utils.lua
│ ├─  test.lua
│ └─  user
│    └─  init.lua
└─  README.md
```

---

## 📋 Plugins List

| lsp                               | auto-competition               | tools                          | ui                                  | utils                           |
| :-------------------------------- | :----------------------------- | :----------------------------- | :---------------------------------- | :------------------------------ |
| glepnir/lspsaga.nvim              | hrsh7th/nvim-cmp               | nvim-tree/nvim-tree.lua        | catppuccin/nvim                     | MunifTanjim/nui.nvim            |
| williamboman/mason.nvim           | hrsh7th/cmp-nvim-lsp           | ThePrimeagen/git-worktree.nvim | akinsho/bufferline.nvim             | nvim-treesitter/nvim-treesitter |
| neovim/nvim-lspconfig             | amarakon/nvim-cmp-buffer-lines | numToStr/Comment.nvim          | nvim-lualine/lualine.nvim           | HiPhish/nvim-ts-rainbow2        |
| jose-elias-alvarez/null-ls.nvim   | hrsh7th/cmp-path               | tanvirtin/vgit.nvim            | lukas-reineke/indent-blankline.nvim | MunifTanjim/nui.nvim            |
| williamboman/mason-lspconfig.nvim | hrsh7th/cmp-cmdline            | luukvbaal/statuscol.nvim       | goolord/alpha-nvim                  | rcarriga/nvim-notify            |
| nvim-treesitter/nvim-treesitter   | hrsh7th/cmp-buffer             | nvim-lua/plenary.nvim          | folke/noice.nvim                    | folke/persistence.nvim          |
| williamboman/mason-lspconfig.nvim | L3MON4D3/LuaSnip               | ThePrimeagen/harpoon           |                                     |
| mfussenegger/nvim-jdtls           | onsails/lspkind.nvim           | nvim-neo-tree/neo-tree.nvim    |
|                                   | saadparwaiz1/cmp_luasnip       |
|                                   | rafamadriz/friendly-snippets   |

---

## 🔧 Plugin Install & Setup

```lua
-- https://github.com/folke/lazy.nvim#examples
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

---

## 👋 THANKS SO

@eggtoopain(Helps me to find git tools.)

> All the people who helped me.  
> No need money!Love make lights!
