## \_spare\_  
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)  
### Installation :inbox_tray:  

```shell
mv ~/.config/nvim/ ~/.config/nvim.bak/
mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
rm -rf ~/.cache/nvim/
```

```pwsh
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```
### Getting Start :card_file_box:  

**Requirements:**  
`nvim:` >= `0.9.5`  
`git:` Install the plugins and manage version.
`fd:` Telescope find files.  
`rg:` Telescope ripgrep.  
`nerdfont:` Terminal icon.  
`c:` Treesitter highlight.  

**Install:**  

```shell
git clone https://github.com/the-essence-of-life/starter ~/.config/nvim/ && nvim
```
### Functions :desktop_computer:  

**Global:**  
`enabled:` <font color=#"aeffa2">@type:string</font> Enabled the feature.  
`set:` <font color=#""ffdca2>@type:table</font> Invoke neovim api.  

**Spec:**  
`options:` <font color=#"ffdca2">@type:table</font> Set neovim options,like `vim.opt` `vim.g` and so on.  
`keymaps:` <font color=#"ffdca2">@type:table</font> Add and change the default keymaps.  
`autocmds:` <font color=#"ffdca2">@type:table</font> Open more features.  

**Example:**  

```lua
return {
  options = {
    ---@type boolean
    -- Enable the default options.
    enabled = true,
    ---@type table
    -- Setting options:
    set = {
      -- vim.opt.number = true
      -- same as:
      -- opt = {
      --    number = true
      -- },
    },
  },
  keymaps = {
    ---@type boolean
    -- Enable the default keymaps.
    enabled = true,
    ---@type table
    -- Setting keymaps:
    set = {
      -- vim.keymap.set("n", ":q", "<cmd>wq<cr>")
      -- same as:
      -- n = {
      -- [";q"] = {
      --    "<cmd>wq<cr>",
      --    more specs are develop......
      -- },
    },
  },
  autocmds = {
    ---@type boolean
    -- Enable the default autocmds.
    enabled = true,
    -- more specs are develop......
  },
}
```

### Setup :gear:  
#### Colorscheme :rainbow:  

```lua
return {
  -- When nil,it will load default colorscheme(habamax).
  colorscheme = "habamax"
}
```
