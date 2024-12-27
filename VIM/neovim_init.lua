-- brew install ripgrep
-- Show line numbers
vim.o.number = true              -- Show line numbers

-- Enable True Color
vim.o.termguicolors = true

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

  -- Leap.nvim
  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require("leap")

      -- Basic setup
      leap.add_default_mappings()

      -- Enable highlighting of all visible targets
      leap.opts.highlight_unlabeled_phase_one_targets = true
    end,
  },

  -- Telescope.nvim (Fuzzy Finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = { -- Insert mode
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-h>"] = require("telescope.actions").cycle_history_prev,
              ["<C-l>"] = require("telescope.actions").cycle_history_next,
            },
            n = { -- Normal mode
              ["j"] = require("telescope.actions").move_selection_next,
              ["k"] = require("telescope.actions").move_selection_previous,
              ["h"] = require("telescope.actions").cycle_history_prev,
              ["l"] = require("telescope.actions").cycle_history_next,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          layout_config = {
            horizontal = { width = 0.8, height = 0.9, preview_width = 0.5 },
            preview_width = 0.5,       -- Reduce preview size
          },
          sorting_strategy = "ascending", -- Show results in ascending order
          dynamic_preview_title = true,   -- Dynamically update preview title
          prompt_prefix = " ",
          selection_caret = " ",
          layout_strategy = "horizontal",
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
          live_grep_args = {
            auto_quoting = true, -- Dynamically quote strings with spaces
          },
        },
      }

      -- Load extensions
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('live_grep_args')
    end,
  },

  -- FZF extension for Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  -- Live grep args extension for Telescope
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- Catppuccin Colorscheme
  {
    "catppuccin/nvim",
    config = function()
      vim.g.catppuccin_flavor = "latte"  -- Set the Catppuccin flavor
      vim.cmd("colorscheme catppuccin")
      vim.o.background = "light"        -- Set the background to light
    end,
  },

  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end,
  },

  -- Gitsigns.nvim (Git integration)
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame = false, -- Disable inline blame
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable for files longer than this
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      }

      -- Keybindings for Git actions
      vim.keymap.set("n", "<leader>hs", function()
        require("gitsigns").stage_hunk()
      end, { desc = "Stage hunk" })

      vim.keymap.set("v", "<leader>hs", function()
        require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") }
      end, { desc = "Stage hunk (visual)" })

      vim.keymap.set("n", "<leader>hS", function()
        require("gitsigns").stage_buffer()
      end, { desc = "Stage entire file" })

      vim.keymap.set("n", "<leader>hu", function()
        require("gitsigns").reset_hunk()
      end, { desc = "Undo stage hunk" })

      vim.keymap.set("n", "<leader>hU", function()
        require("gitsigns").reset_buffer()
      end, { desc = "Reset buffer" })

      vim.keymap.set("n", "<leader>hp", function()
        require("gitsigns").preview_hunk()
      end, { desc = "Preview hunk" })

      vim.keymap.set("n", "<leader>hb", function()
        require("gitsigns").blame_line()
      end, { desc = "Blame line" })
    end,
  }
}

-- Load plugins using lazy.nvim
require("lazy").setup(plugins, {})

-- Keybindings
-- Telescope keybindings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })  -- File search
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })   -- Text search
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" }) -- Open buffers
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })  -- Help tags
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Find recent files" }) -- A list of recent files

-- Go to the next buffer
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })

-- Go to the previous buffer
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })

-- Close the current buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Reopen the last buffer
vim.keymap.set("n", "<leader>bl", ":b#<CR>", { desc = "Last buffer" })

-- Open Lazy
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { desc = "Open Lazy.nvim" })
