<div align="center">

# _Spare-Nvim

</div>

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

---

<<<<<<< HEAD
=======
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
<<<<<<< HEAD
=======
&ensp;`luajit` >= 2.1.0-beta3
>>>>>>> main

**Oprional:**  
&ensp;&ensp;`fd` >= `8.7.0`  
&ensp;&ensp;`rg(ripgrep)` >= `8.7.0`
&ensp;&ensp;`shellcheck`,`shellharden`(Grammer check)

**You can use linux package manager to install it.**  
**For example:`pacman`,`pkg`,`apt`,`dnf` and so on.**

---

## 📖 Language Support

- Front-end full Language  
<img height="36" width="36" src="https://cdn.simpleicons.org/html5/FF632E" /> <img height="36" width="36" src="https://cdn.simpleicons.org/css3/5DFFFF" /> <img height="36" width="36" src="https://cdn.simpleicons.org/javascript/FFAE5D" /> <img height="36" width="36" src="https://cdn.simpleicons.org/typescript/46B9FF" />

- <img height="14" width="14" src="https://cdn.simpleicons.org/c/17A8FF" /> C-family full Language
  > **NOTE** - To support it,you'll copy these code to your neovim configruation.

```lua
-- ~/.config/nvim/lua/bin/plugins/lsp/lsp-settings.lua
require("lspconfig").clangd.setup{}

```

- <img height="14" width="14" src="https://cdn.simpleicons.org/lua/5DAEFF" /> Lua(needs to install `lua-language-server` in your terminal.)

---

## 💻 Setup

**Step1** Backup your config and remove your caches.

```bash
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/
```
<details>
<summary>If you use config on windows</summary>

```bash
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

</details>

**Step2** Clone this repo,ensure that dependencies are installed correctly.
```bash
git clone --depth=1 https://github.com/the-essence-of-life/spare/ ~/.config/nvim/

```
<details>
<summary>If you're gitee user</summary>

```diff
- git clone --depth=1 https://github.com/the-essence-of-life/spare/ ~/.config/nvim/
+ git clone --depth=1 https://gitee.com/the-essence-of-life/spare/ ~/.config/nvim/

```

</details>
<details>
<summary>If you use config on windows</summary>

```diff
- git clone --depth=1 https://github.com/the-essence-of-life/spare/ ~/.config/nvim/
+ git clone --depth=1 https://githuh.com/the-essence-of-life/spare/ $env:LOCALAPPDATA\nvim

```

</details>


**Step3** Final,start your neovim.  
`nvim`

---

## 🛠 Configruation

<details>
<summary>Basic configruation</summary>

**Make a directory.**  

```bash
mkdir -p ~/.config/nvim/lua/user/
nvim ~/.config/nvim/lua/user/config.lua
```
**Copy these code.**

You can see examples [here](https://github.com/folke/lazy.nvim#examples).  
**Step1** Change the working directory and touch a config file(You can put longest config here.)  
```sh
cd ~/.config/nvim/lua/bin/plugins/user/
touch <plugins-config>.lua
```
**Step2** Then copy these code to `user.lua`(run:`nvim user.lua`)


```lua
return {
  options = {
    enabled = true,
  },
  keymaps = {
    enabled = true,
  },
  autocmds = {
    enabled = true,
    lastplace = true,
    directory = true,
  },
  plugin = {
    enabled = true,
    mode = "plugins",
  },
}
```

</details>

<details>
<summary>If you want to set new options,you can add `set = {}`.It can auto merge.</summary>

You can click [here](./diff/new-options.diff) to see more information.

```lua
return {
  options = {
    set = {},
  },
  keymaps = {
    set = {},
  },
  autocmds = {
    set = {},
  },
  plugin = {
    set = {},
  },
}

```

</details>

<details>
<summary>If you want to use your script,add `modules = {}` in your table.</summary>

You can click [here](./diff/modules.diff) to see more information.

```lua
return {
  modules = {
    "your.module.name",
    "test.module",
  },
}
```

</details>

<details>
<summary>If you want to change your plugins path,add `plugin.set = { spec = { import = {} } }` can do it.</summary>

You can click [here](./diff/plugins-path.diff) to see more information.

```lua
return {
  plugin = {
    set = {
      spec = {
        { import = "your.module.path" },
      },
    },
  }
}
```

</details>
