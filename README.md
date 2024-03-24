<div align="center">

# _Spare-Nvim

</div>

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

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
