-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Custom Keymaps ]]

-- Unbind 's' key to avoid conflict with surround
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
vim.keymap.set({ 'n', 'x' }, 'S', '<Nop>')

-- File navigation, open ex mode
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = 'Open vim Ex file explorer' })
vim.keymap.set('n', '<leader><Tab>', '<cmd>b#<CR>', { desc = 'Switch to previous buffer' })

-- Keep selection after indentation
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- Keep same content in register after pasting
vim.keymap.set('x', '<leader>p', '"_dP')

-- Copy line and comment original
vim.keymap.set('n', 'yd', 'yygccp', { remap = true, desc = 'Duplicate line and comment' })

-- Improve scrolling navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Vertical scrolling by a few lines, find better mappings?
vim.keymap.set('n', '<C-j>', '5jzzzv', { desc = 'Move down by 5 lines' })
vim.keymap.set('n', '<C-k>', '5kzzzv', { desc = 'Move up by 5 lines' })

-- Horizontal movement
-- Replace if better options come up
vim.keymap.set('n', '<C-h>', '^', { desc = 'Move to first non-whitespace characted in line' })
vim.keymap.set('n', '<C-h>', '$', { desc = 'Move to first non-whitespace characted in line' })

-- Swap lines
vim.keymap.set('n', '<leader>mj', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<leader>mk', ':m .-2<CR>==', { desc = 'Move line up' })

vim.keymap.set('x', '<leader>mj', ':m >+1<CR>gv=gv', { desc = 'Move line down in visual mode' })
vim.keymap.set('x', '<leader>mk', ':m <-2<CR>gv=gv', { desc = 'Move line up in visual mode' })
