-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^6', -- Recommended
  --   lazy = false, -- This plugin is already lazy
  -- },
  {
    'danymat/neogen',
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true }),
    },
  },
  {
    'kawre/neotab.nvim',
    event = 'InsertEnter',
    opts = {
      -- configuration goes here
    },
  },

  -- MY_THEMES_BEGIN
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    opts = ...,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
  },
  { 'EdenEast/nightfox.nvim' }, -- nightfox themes https://github.com/EdenEast/nightfox.nvim
  { 'nyoom-engineering/oxocarbon.nvim' }, -- https://github.com/nyoom-engineering/oxocarbon.nvim
  { 'rose-pine/neovim' }, -- https://github.com/rose-pine/neovim
  { 'savq/melange-nvim' }, -- https://github.com/savq/melange-nvim
  { 'xero/miasma.nvim' }, -- https://github.com/xero/miasma.nvim
  { 'catppuccin/nvim' }, -- https://github.com/catppuccin/nvim
  { 'rebelot/kanagawa.nvim' }, -- https://github.com/rebelot/kanagawa.nvim
  { 'vague-theme/vague.nvim' }, -- https://github.com/vague-theme/vague.nvim
  -- MY_THEMES_END

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
      vim.cmd [[colorscheme aura-dark]]
    end,
  },
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          -- dark mode themes
          'gruvbox',
          'tokyonight',
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
          -- light mode themes
          'tokyonight-day',
          'catppuccin-latte',
          'rose-pine-dawn',
          'dayfox',
          'dawnfox',
          'kanagawa-lotus',
        },
        livePreview = true,
      }
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      require('barbar').setup {
        icons = {
          filetype = {
            enabled = true,
          },
        },
      }
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  { -- https://github.com/nvimdev/dashboard-nvim
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          footer = { '🇺🇸' },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>lf', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit Current File' },
    },
  },
  {
    -- https://github.com/hat0uma/csvview.nvim
    'hat0uma/csvview.nvim',
    opts = {
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
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
    keys = {
      { '<leader>lc', '<cmd>CsvViewToggle<cr>', desc = 'Toggle CsvView' },
    },
  },
  { -- https://github.com/FabijanZulj/blame.nvim
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
    opts = {
      date_format = '%m.%d.%Y',
    },
    keys = {
      { '<leader>tB', '<cmd>BlameToggle<cr>', desc = '[T]oggle [B]lame View' },
    },
  },
}
