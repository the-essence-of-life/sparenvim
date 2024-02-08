<div align="center">

# _Spare-Nvim

<!-- <a href='https://postimg.cc/QKgRcR6R' target='_blank'><img src='https://i.postimg.cc/QKgRcR6R/IMG-20230501-192206.jpg' border='0' alt='IMG-20230501-192206'/></a> -->
![Stitch_20230619_193741.png](https://img1.imgtp.com/2023/06/19/vFQahSB5.png)

<!-- ### 此 space-nvim 非彼 spacevim -->

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

**Step2** Clone this repo,ensure that dependencies are installed correctly.
```bash
git clone --depth=1 https://gitee.com/the-essence-of-life/spare/ ~/.config/nvim/

```
<details>
<summary>If you're github user</summary>

```diff
- git clone --depth=1 https://gitee.com/the-essence-of-life/spare/ ~/.config/nvim/
+ git clone --depth=1 https://github.com/the-essence-of-life/spare/ ~/.config/nvim/

```

</details>


**Step3** Final,start your neovim.  
`nvim`

---

## 🛠 Configruation

<details>
<summary>Copy these code on `~/.config/nvim/lua/user/config.lua`.</summary>

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

```diff
return {
  options = {
    enabled = true,
+   set = {},
  },
  keymaps = {
    enabled = true,
+   set = {},
  },
  autocmds = {
    enabled = true,
    lastplace = true,
    directory = true,
+   set = {},
  },
  plugin = {
    enabled = true,
    mode = "plugins",
+   set = {},
  },
}
```

</details>

<details>
<summary>If you want to use your script,add `modules = {}` in your table.</summary>

```diff
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
+ modules = {
+   "your.module.name",
+   "test.module",
+ },
  plugin = {
    enabled = true,
    mode = "plugins",
  },
}
```

</details>

<details>
<summary>If you want to change your plugins path,add `plugin.set = { spec = { import = {} } }` can do it.</summary>

```diff
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
+   set = {
+     spec = {
+       { import = "your.module.path" },
+     },
+   },
  },
}
```

</details>
