return {
  {
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
    keys = {
      { '<leader>gb', '<cmd>BlameToggle<CR>', desc = 'Toggle git blame' },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'otavioschwanck/github-pr-reviewer.nvim',
    opts = {
      -- options here
    },
    keys = {
      { '<leader>gp', '<cmd>PRReviewMenu<cr>', desc = 'PR Review Menu' },
      { '<leader>gp', ":<C-u>'<,'>PRSuggestChange<CR>", desc = 'Suggest change', mode = 'v' },
    },
  },
}
