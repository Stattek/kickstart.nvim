-- File for theme-related plugins.

-- import helpers tables so we can use their functions
local url_helpers = require 'helpers.url_helpers'

do
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
end
