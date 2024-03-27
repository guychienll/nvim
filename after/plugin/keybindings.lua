local wk = require 'which-key'

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 300
wk.setup {}

wk.register({
  c = {
    name = 'configs',
    v = { '<cmd>e $HOME/.config/nvim/init.lua<cr>', 'Open Config' },
    p = { '<cmd>e $HOME/.config/nvim/lua/plugins/init.lua<cr>', 'Open Plugins Config' },
    k = { '<cmd>e $HOME/.config/nvim/after/plugin/keybindings.lua<cr>', 'Open Keybinding' },
  },
}, { prefix = '<leader>' })

wk.register({
  l = {
    name = 'left',
    { '<cmd>bnext<cr>', 'next buffer' },
  },
  h = {
    name = 'right',
    { '<cmd>bprevious<cr>', 'previous buffer' },
  },
  q = {
    name = 'quit',
    { '<cmd>bdelete<cr>', 'delete buffer' },
  },
}, { prefix = '<C-t>' })

wk.register({
  ['<M-1>'] = { '<cmd>1ToggleTerm size=60 direction=vertical<cr>', 'toggle ternimal 1' },
  ['<M-2>'] = { '<cmd>2ToggleTerm size=60 direction=vertical<cr>', 'toggle ternimal 2' },
  ['<M-p>'] = { '<cmd>Telescope find_files<cr>', 'file find' },
  ['<M-S-j>'] = { '<cmd>lua _lazygit_toggle()<cr>', 'toggle ternimal' },
  ['<M-S-p>'] = { '<cmd>Telescope commands<cr>', 'commands' },
  ['<M-S-e>'] = { '<cmd>NvimTreeToggle<cr>', 'file explore' },
  ['<M-S-f>'] = { '<cmd>lua= vim.lsp.buf.format()<cr>', 'file format' },
  ['<M-S-CR>'] = { '<cmd>lua= vim.lsp.buf.code_action()<cr>', 'code actions' },
  ['<M-o>'] = {
    '<cmd>Telescope lsp_document_symbols<cr>',
    'go to definitions',
  },
  z = {
    name = 'others',
    n = { '<cmd>lua= vim.diagnostic.goto_next()<cr>', 'go to next error' },
    p = { '<cmd>lua= vim.diagnostic.goto_next()<cr>', 'go to previous error' },
  },
}, {})
