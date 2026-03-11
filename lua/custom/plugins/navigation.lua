return {
  {
    'unblevable/quick-scope',
    event = 'VeryLazy', -- Loads on demand for better startup speed
    config = function()
      -- Set highlighting only on key press to reduce noise
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      -- Example highlight colors
      vim.cmd "highlight QuickScopePrimary guifg='#df7300' gui=underline"
      vim.cmd "highlight QuickScopeSecondary guifg='#b75fff' gui=underline"
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
}
