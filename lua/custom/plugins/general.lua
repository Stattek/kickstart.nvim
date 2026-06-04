-- File for general plugins for all filetypes or general functionality.
--

-- import helpers tables so we can use their functions
local url_helper = require 'helpers.url_helper'
local pack_helper = require 'helpers.pack_helper'

do
  vim.pack.add { url_helper.gh 'danymat/neogen' }
  local neogen = require 'neogen'
  neogen.setup {}
  vim.keymap.set('n', '<Leader>nf', function() neogen.generate() end, { noremap = true, silent = true })

  vim.pack.add { url_helper.gh 'kawre/neotab.nvim' }
  require('neotab').setup {
    event = 'InsertEnter',
    opts = {
      -- configuration goes here
    },
  }

  -- barbar setup
  vim.pack.add {
    url_helper.gh 'romgrk/barbar.nvim',
    -- dependencies
    url_helper.gh 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    url_helper.gh 'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
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
    url_helper.gh 'nvimdev/dashboard-nvim',
    -- dependencies
    url_helper.gh 'nvim-tree/nvim-web-devicons',
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

  vim.pack.add { url_helper.gh 'kdheepak/lazygit.nvim', url_helper.gh 'nvim-lua/plenary.nvim' }
  local lazygit = require 'lazygit'
  vim.keymap.set('n', '<leader>lg', function() lazygit.lazygit() end, { desc = '[L]azy[G]it' })
  vim.keymap.set('n', '<leader>lf', function() lazygit.lazygitcurrentfile() end, { desc = '[L]azyGit Current [F]ile' })

  -- https://github.com/sindrets/diffview.nvim
  pack_helper.vim_pack_add_simple(url_helper.gh 'sindrets/diffview.nvim', 'diffview')

  -- https://github.com/hiphish/rainbow-delimiters.nvim
  vim.pack.add { url_helper.gh 'hiphish/rainbow-delimiters.nvim' }
end
