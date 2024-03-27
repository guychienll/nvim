local lsp_zero = require 'lsp-zero'

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'tsserver', 'cssls', 'bashls', 'html' },
  handlers = {
    lsp_zero.default_setup,
  },
}

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps { buffer = bufnr }
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
end)

local lspconfig = require 'lspconfig'

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
