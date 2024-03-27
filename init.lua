require 'plugins'

vim.cmd 'colorscheme tokyonight'
vim.cmd 'syntax on'
vim.cmd 'filetype on'
vim.cmd 'filetype indent on'
vim.cmd 'filetype plugin on'

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.hidden = true

vim.opt.backspace:remove 'indent'
vim.opt.backspace:append 'indent,eol,start'
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true, silent = true })
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.g.mapleader = ';'
