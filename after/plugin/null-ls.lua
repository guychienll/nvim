local default_formatting_config_dir = string.format('%s/.config/nvim/lua/plugins/formatting/configs/', vim.env.HOME)
local default_diagnostics_config_dir = string.format('%s/.config/nvim/lua/plugins/diagnostics/configs/', vim.env.HOME)

local config_finder = function(config_names, default_dir)
  -- prevent that user not provide last seperator
  if string.sub(default_dir, string.len(default_dir)) ~= '/' then
    default_dir = default_dir .. '/'
  end

  local config_dir = ''

  -- search from project recursively
  for _, name in ipairs(config_names) do
    local found_root = require('lspconfig').util.root_pattern(name)(vim.loop.cwd())
    if found_root then
      config_dir = found_root .. '/' .. name
      return config_dir
    end
  end

  -- search from defalut_dir
  for _, name in ipairs(config_names) do
    if vim.loop.fs_stat(default_dir .. name) then
      config_dir = default_dir .. name
      return config_dir
    end
  end

  return config_dir
end

local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local prettier_default_config_path =
  config_finder({ '.prettierrc.js', '.prettierrc.json' }, default_formatting_config_dir)
local lua_default_config_path = config_finder({ 'stylua.toml', '.stylua.toml' }, default_formatting_config_dir)
local eslint_default_config_path = config_finder({ '.eslintrc.js', '.eslintrc.json' }, default_diagnostics_config_dir)

null_ls.setup {
  debug = true,
  sources = {
    formatting.prettierd.with {
      filetypes = {
        'html',
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
      extra_args = {
        string.format('--config=%s', prettier_default_config_path),
      },
    },
    formatting.stylua.with {
      filetypes = { 'lua' },
      extra_args = {
        string.format('--config-path=%s', lua_default_config_path),
      },
    },
    diagnostics.eslint_d.with {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
      extra_args = {
        string.format('-c=%s', eslint_default_config_path),
      },
    },
  },
}
