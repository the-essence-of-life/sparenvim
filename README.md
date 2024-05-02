## \_spare\_  
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)  

**spare.nvim** is a freedom configruation, you can easily disable some functions in your settings.  

### :card_file_box: Getting Started  

#### Requirements:  
- `nvim:` >= `0.9.5`  
- `git:` Install the plugins and manage version.
- `fd:` Telescope find files.  
- `rg:` Telescope ripgrep.  
- `nerdfont:` Terminal icon.  
- `c:` Treesitter highlight.  

> [!IMPORTANT]
> You should **backup** your old neovim configruation:  
> ###### For linux:  
>
> ```shell
> mv ~/.config/nvim/ ~/.config/nvim.bak/
> mv ~/.local/share/nvim/ ~/.local/share/nvim.bak/
> mv ~/.local/state/nvim/ ~/.local/state/nvim.bak/
> rm -rf ~/.cache/nvim/
> ```
> ###### For windows:  
>
> ```pwsh
> Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
> Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
> ```

#### Install:  

```shell
git clone https://github.com/the-essence-of-life/starter ~/.config/nvim/ && nvim
```

### :gear: Configruation  

> [!NOTE]
> **spare.nvim** has some options:  
> Copy this command can quickly open:  
> ```sh
> nvim ~/.config/nvim/lua/core/config.lua
> ```

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
  health = {
    check = {
      basic = true,
      lsp = true,
    },
  },
  lsp = {
    server = {
      -- <lsp-server-name> = {<settings>}
      lua_ls = {},
      bashls = {},
    },
    icons = true,
    diagnostics = {
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        focused = true,
        source = "always",
        border = "rounded",
      },
    },
  },
}
```

### :rainbow: Colorscheme

```lua
return {
  -- When nil,it will load default colorscheme(habamax).
  colorscheme = nil,

  -- You can also use function:
  colorscheme = function()
    require("tokyonight").load()
  end,

  -- You can set a string, it will auto load `vim.cmd.colorscheme()`
  colorscheme = "habamax",
}
```

### Language Server

```lua
return {
  lsp = {
    server = {
      -- Put your server config here!
      bashls = {},
    }
  }
}
```
