-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- import helpers tables so we can use their functions
local url_helpers = require 'helpers.url_helpers'
local simple_setup = require 'helpers.simple_setup'

do
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^6', -- Recommended
  --   lazy = false, -- This plugin is already lazy
  -- },
  vim.pack.add { url_helpers.gh 'danymat/neogen' }
  require('neogen').setup {
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true }),
    },
  }

  vim.pack.add { url_helpers.gh 'kawre/neotab.nvim' }
  require('neotab').setup {
    event = 'InsertEnter',
    opts = {
      -- configuration goes here
    },
  }

  -- MY_THEMES_BEGIN
  vim.pack.add { url_helpers.gh 'ellisonleao/gruvbox.nvim' }
  require('gruvbox').setup {
    priority = 1000,
    config = true,
    opts = ...,
  }

  vim.pack.add { url_helpers.gh 'olimorris/onedarkpro.nvim' }
  require('onedarkpro').setup {
    priority = 1000, -- Ensure it loads first
  }

  vim.pack.add {
    -- nightfox themes https://github.com/EdenEast/nightfox.nvim
    url_helpers.gh 'EdenEast/nightfox.nvim',
    -- https://github.com/nyoom-engineering/oxocarbon.nvim
    url_helpers.gh 'nyoom-engineering/oxocarbon.nvim',
    -- https://github.com/rose-pine/neovim
    url_helpers.gh 'rose-pine/neovim',
    -- https://github.com/savq/melange-nvim
    url_helpers.gh 'savq/melange-nvim',
    -- https://github.com/xero/miasma.nvim
    url_helpers.gh 'xero/miasma.nvim',
    -- https://github.com/catppuccin/nvim
    url_helpers.gh 'catppuccin/nvim',
    -- https://github.com/rebelot/kanagawa.nvim
    url_helpers.gh 'rebelot/kanagawa.nvim',
    -- https://github.com/vague-theme/vague.nvim
    url_helpers.gh 'vague-theme/vague.nvim',
    -- https://github.com/Shatur/neovim-ayu
    'https://github.com/Shatur/neovim-ayu',
    -- https://github.com/yorumicolors/yorumi.nvim
    'https://github.com/yorumicolors/yorumi.nvim',
    -- https://github.com/rockerBOO/boo-colorscheme-nvim
    'https://github.com/rockerBOO/boo-colorscheme-nvim',
    url_helpers.gh 'baliestri/aura-theme',
  }
  -- MY_THEMES_END
  vim.pack.add { url_helpers.gh 'zaldih/themery.nvim' }
  require('themery').setup {
    themes = {
      --- dark mode themes
      'gruvbox',
      -- tokyonight,
      'tokyonight-storm',
      'tokyonight-night',
      'tokyonight-moon',
      'aura-dark',
      'nightfox',
      'duskfox',
      'nordfox',
      'terafox',
      'carbonfox',
      'onedark',
      'onedark_dark',
      'onedark_vivid',
      'catppuccin',
      'catppuccin-mocha',
      'catppuccin-macchiato',
      'catppuccin-frappe',
      'oxocarbon',
      'rose-pine',
      'rose-pine-moon',
      'rose-pine-main',
      'melange',
      'miasma',
      'kanagawa',
      'kanagawa-dragon',
      'kanagawa-wave',
      'vague',
      -- boo
      'boo',
      'sunset_cloud',
      'radioactive_waste',
      'forest_stream',
      'crimson_moonlight',
      -- yorumi',
      'yorumi-abyss',
      -- ayu,
      'ayu-dark',
      'ayu-mirage',
      --- light mode themes
      'tokyonight-day',
      'catppuccin-latte',
      'rose-pine-dawn',
      'dayfox',
      'dawnfox',
      'kanagawa-lotus',
      'ayu-light',
    },
    livePreview = true,
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
    config = {
      week_header = {
        enable = true,
      },
      footer = { '🇺🇸' },
    },
  }

  -- TODO: if this slows down nvim, think about lazily loading it with the async queue
  vim.pack.add { url_helpers.gh 'kdheepak/lazygit.nvim', url_helpers.gh 'nvim-lua/plenary.nvim' }
  local lazygit = require 'lazygit'
  vim.keymap.set('n', '<leader>lg', function() lazygit.lazygit() end, { desc = '[L]azy[G]it' })
  vim.keymap.set('n', '<leader>lf', function() lazygit.lazygitcurrentfile() end, { desc = '[L]azyGit Current [F]ile' })

  -- https://github.com/hat0uma/csvview.nvim
  vim.pack.add { 'https://github.com/hat0uma/csvview.nvim' }
  require('csvview').setup {
    parser = { comments = { '#', '//' } },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { 'if', mode = { 'o', 'x' } },
      textobject_field_outer = { 'af', mode = { 'o', 'x' } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
      jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
      jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
      jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
    },
  }
  vim.keymap.set('n', '<leader>lc', '<cmd>CsvViewToggle<cr>', { desc = 'Toggle CsvView' })

  -- https://github.com/FabijanZulj/blame.nvim
  vim.pack.add { url_helpers.gh 'FabijanZulj/blame.nvim' }
  require('blame').setup {
    date_format = '%m.%d.%Y',
  }
  vim.keymap.set('n', '<leader>tB', '<cmd>BlameToggle<cr>', { desc = 'Toggle CsvView' })

  -- https://github.com/sindrets/diffview.nvim
  simple_setup.vim_pack_add_simple(url_helpers.gh 'sindrets/diffview.nvim', 'diffview')

  -- https://github.com/hiphish/rainbow-delimiters.nvim
  vim.pack.add { url_helpers.gh 'hiphish/rainbow-delimiters.nvim' }
end
