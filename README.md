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
`enabled:` @type:string Enabled the feature.  
`set:` @type:table Invoke neovim api.  

**Spec:**  
`options:` @type:table Set neovim options,like `vim.opt` `vim.g` and so on.  
`keymaps:` @type:table Add and change the default keymaps.  
`autocmds:` @type:table Open more features.  

**Example:**  

```lua
return {
  options = {
    ---@type boolean
    enabled = true,
    ---@type table
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
    enabled = true,
    ---@type table
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
    enabled = true,
    -- more specs are develop......
  },
}
```

### Setup :gear:  
#### Colorscheme :rainbow:  
