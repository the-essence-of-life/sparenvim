<div align="center">

# _Spare-Nvim

<!-- <a href='https://postimg.cc/QKgRcR6R' target='_blank'><img src='https://i.postimg.cc/QKgRcR6R/IMG-20230501-192206.jpg' border='0' alt='IMG-20230501-192206'/></a> -->
![Stitch_20230619_193741.png](https://img1.imgtp.com/2023/06/19/vFQahSB5.png)

<!-- ### 此 space-nvim 非彼 spacevim -->

</div>

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

---

## 📑 Content
- [🎉 Feature](#-feature)
- [📡 Dependencies](#-dependencies)
- [💻 Setup](#-setup)
- [📋 Plugins List](#-plugins-list)
- [➕ Add New Plugins](#-add-new-plugins)
- [🛠 Maintain your configuration](#-maintain-your-configuration)
- [👋 Thanks So](#-thanks-so)

---

## 🎉 Feature

make file:(Not gcc,shell script.)

- `make sync`:Sync the latest plugins(Ensure that the network is smooth).
- `make update`:Update to latest config.
- `make debug`:Debug your neovim(Only applicable to versions above 10.0).
- `make rec`:Delete your all neovim config.(Use with caution)
- `make set-options`:Quick switch the config directory.
- `make add-plugins`:Quick switch the plugins directory.

---

## 📡 Dependencies

<!-- <img height="12" width="12" src="https://cdn.simpleicons.org/<name>/<colors>" /> -->
**Must:**  
&ensp;&ensp;[nerdfont](https://www.nerdfonts.com/font-downloads) (To show the terminal icons.)  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/neovim/00A500" /> `neovim` >= `0.10.0`  
&ensp;&ensp;_Comment:_ In the future, version 0.83 will be adapted.  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/git/D76C00" /> `git` >= `2.41.0`  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/c/4E93D7" /> `clang(treesitter need)` >= `3.26.4`  
&ensp;&ensp;<img height="14" width="14" src="https://cdn.simpleicons.org/nodedotjs/74FF85" /> `nodejs(mason need)` >= `19.*`
&ensp;`luajit` >= 2.1.0-beta3

**Oprional:**  
&ensp;&ensp;`fd` >= `8.7.0`  
&ensp;&ensp;`rg(ripgrep)` >= `8.7.0`

**You can use linux package manager to install it.**  
**For example:`pacman`,`pkg`,`apt`,`dnf` and so on.**

---


## 💻 Setup

**Step1** Backup your config and remove your caches.

```sh
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/
```

**Step2** Clone this repo,ensure that dependencies are installed correctly.
```sh
 clone --depth=1 https://github.com/the-essence-of-life/space-nvim/ ~/.config/nvim/

```

**Step3** Final,start your neovim.  
`nvim`

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

## ➕ Add New Plugins

You can see examples [here](https://github.com/folke/lazy.nvim#examples).  
**Step1** Change the working directory and touch a config file(You can put longest config here.)  
```sh
cd ~/.config/nvim/lua/bin/plugins/user/
touch <plugins-config>.lua
```
**Step2** Then copy these code to `user.lua`(run:`nvim user.lua`)

```lua
return {
  -- NOTE:Packer on 'requires' function are change on 'dependencies'.
  "foo/bar",
  dependencies = {},
  -- [event,ft,keys,cmd] are lazy-loading.
  event = "VeryLazy",
  -- [config,init,cond] are configruation.
  config = function()
    require("bin.plugins")
  end,
}
-- i to insert,<Esc> can quit the insert mode.
-- Then :wq to save the files.
```

**Step3** Finally,input `nvim user.lua` in your terminal again,you'll find these packages are auto installed.

---

## 🛠 Maintain your configuration

### Change your package manager

First,find `init.lua`:
```sh
## If use default config:
nvim ~/.config/nvim/lua/bin/init.lua

## If use user config:
nvim ~/.config/nvim/lua/user/init.lua
```

Finally,Remove this line:
You can [Click it](./lua/user/init.lua#L15) to view the code.
```lua
require("bin.config.lazy").deployment_lazy()
```

### Language Support

- Front-end full Language  
<img height="36" width="36" src="https://cdn.simpleicons.org/html5/FF632E" /> <img height="36" width="36" src="https://cdn.simpleicons.org/css3/5DFFFF" /> <img height="36" width="36" src="https://cdn.simpleicons.org/javascript/FFAE5D" /> <img height="36" width="36" src="https://cdn.simpleicons.org/typescript/46B9FF" />

- <img height="14" width="14" src="https://cdn.simpleicons.org/c/17A8FF" /> C-family full Language
> **NOTE** To support it,you'll copy these code to your neovim configruation.  You can [Click here](./lua/bin/plugins/lsp/lsp-settings.lua#L77) to view the code.

```lua
-- ~/.config/nvim/lua/bin/plugins/lsp/lsp-settings.lua
require("lspconfig").clangd.setup{}

```

- <img height="14" width="14" src="https://cdn.simpleicons.org/lua/5DAEFF" /> Lua(needs to install `lua-language-server` in your terminal.)

### Add a new language language-server

**Step1** Input `:Mason` in your neovim.  
**Step2** `<c-f>` search language-server,for example:bash,and type Enter.Type 2 to swtich lsp.  
**Step3** Input "i" to install the language-server,type Enter to view the information.
**Step4** Add some code-snippets in your configruation.  
**NOTE**  
You can [click it](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) to view more information.  
You can also input `:help lspconfig-all` in your neovim.


---

## 👋 THANKS SO

@eggtoopain(Helps me to find git tools.)

> All the people who helped me.  
> No need money!Love make lights!
