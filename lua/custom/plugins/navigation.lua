return {
  'unblevable/quick-scope',
  event = 'VeryLazy', -- Loads on demand for better startup speed
  config = function()
    -- Set highlighting only on key press to reduce noise
    vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    -- Example highlight colors
    vim.cmd "highlight QuickScopePrimary guifg='#df7300' gui=underline"
    vim.cmd "highlight QuickScopeSecondary guifg='#b75fff' gui=underline"
  end,
}
