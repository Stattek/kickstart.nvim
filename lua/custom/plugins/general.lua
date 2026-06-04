-- File for general plugins for all filetypes or general functionality.
--

-- import helpers tables so we can use their functions
local url_helpers = require 'helpers.url_helpers'
local simple_setup = require 'helpers.simple_setup'

do
  vim.pack.add { url_helpers.gh 'danymat/neogen' }
  local neogen = require 'neogen'
  neogen.setup {}
  vim.keymap.set('n', '<Leader>nf', function() neogen.generate() end, { noremap = true, silent = true })

  vim.pack.add { url_helpers.gh 'kawre/neotab.nvim' }
  require('neotab').setup {
    event = 'InsertEnter',
    opts = {
      -- configuration goes here
    },
  }

  -- barbar setup
  vim.pack.add {
    url_helpers.gh 'romgrk/barbar.nvim',
    -- dependencies
    url_helpers.gh 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    url_helpers.gh 'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  }
  require('barbar').setup {
    icons = {
      filetype = {
        enabled = true,
      },
    },
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = vim.version.range '1.*', -- optional: only update when a new 1.x version is released
  }
  vim.g.barbar_auto_setup = false

  vim.pack.add {
    url_helpers.gh 'nvimdev/dashboard-nvim',
    -- dependencies
    url_helpers.gh 'nvim-tree/nvim-web-devicons',
  }
  require('dashboard').setup { -- https://github.com/nvimdev/dashboard-nvim
    theme = 'hyper',
    packages = { enable = true },
    config = {
      week_header = {
        enable = false,
      },
      footer = { '🇺🇸' },
    },
  }

  vim.pack.add { url_helpers.gh 'kdheepak/lazygit.nvim', url_helpers.gh 'nvim-lua/plenary.nvim' }
  local lazygit = require 'lazygit'
  vim.keymap.set('n', '<leader>lg', function() lazygit.lazygit() end, { desc = '[L]azy[G]it' })
  vim.keymap.set('n', '<leader>lf', function() lazygit.lazygitcurrentfile() end, { desc = '[L]azyGit Current [F]ile' })

  -- https://github.com/sindrets/diffview.nvim
  simple_setup.vim_pack_add_simple(url_helpers.gh 'sindrets/diffview.nvim', 'diffview')

  -- https://github.com/hiphish/rainbow-delimiters.nvim
  vim.pack.add { url_helpers.gh 'hiphish/rainbow-delimiters.nvim' }
end
