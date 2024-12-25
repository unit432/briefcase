-- Show line numbers
vim.o.number = true              -- Show line numbers

-- Encoding
vim.o.encoding = 'utf-8'         -- Set file encoding to UTF-8

-- Whitespace settings
vim.o.backspace = 'indent,eol,start'  -- Configure backspace behavior
vim.o.autoindent = true              -- Enable auto-indentation
vim.o.shiftwidth = 2                 -- Set number of spaces for indentation
vim.o.softtabstop = 2               -- Set number of spaces for a tab
vim.o.expandtab = true              -- Use spaces instead of tabs

-- Show line numbers again (redundant, but included as per your config)
vim.o.number = true                -- Show line numbers again (redundant, can be omitted)

-- Set space as the leader key
vim.g.mapleader = " "  -- Set leader key to space


-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Setup
local plugins = {
  -- Alpha.nvim (Dashboard plugin)
  {
    "goolord/alpha-nvim", 
    config = function()
      local alpha = require'alpha'
      local dashboard = require'alpha.themes.dashboard'

      -- Set the custom header (ASCII Art or custom text)
      dashboard.section.header.val = {
        "   ____  _   _          ____    ____ ____ ",
        "  |  _ \\| | | | ___ ___| __ ) | __ ) ___|",
        "  | |_) | | | |/ _ ` __|  _ \\ |  _ \\ / _ \\",
        "  |  __/| |_| |  __/  __| |_) || __/|  __/",
        "  |_|    \\___/ \\___|_|   |____/ |____|\\___|"
      }

      -- Define buttons for quick access actions
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
        dashboard.button("p", "  Project", ":Telescope projects<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Setup the alpha dashboard with the defined configuration
      alpha.setup(dashboard.config)
    end
  },

  -- Telescope.nvim (Fuzzy Finder)
  {
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup {
        defaults = {
          prompt_position = "top",
          prompt_prefix = " ",
          selection_caret = " ",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { width = 0.8, height = 0.9, preview_width = 0.5 },
            vertical = { width = 0.9, height = 0.8, preview_height = 0.5 },
          },
          mappings = {
            i = {
              ["<C-u>"] = require("telescope.actions").delete_buffer,
              ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          live_grep = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      }

      -- Load fzf extension for better fuzzy matching
      require('telescope').load_extension('fzf')
    end
  },

  -- FZF extension for Telescope
  { 
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      -- Enable FZF extension
      require('telescope').load_extension('fzf')
    end
  },

  -- Catppuccin Colorscheme
  {
    "catppuccin/nvim",
    config = function()
      -- Set the Catppuccin flavor to Latte
      vim.g.catppuccin_flavor = "latte"  -- Using the "latte" flavor

      -- Apply the colorscheme
      vim.cmd("colorscheme catppuccin")
      
      -- Set background to "dark" or "light"
      vim.o.background = "light"
    end
  },
}

-- Load plugins using lazy.nvim
require("lazy").setup(plugins, {})
