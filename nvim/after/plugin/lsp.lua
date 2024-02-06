local lsp = require("lsp-zero")
local vim = vim
local k = vim.keymap.set

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  k("n", "gd", function() vim.lsp.buf.definition() end, opts)
  k("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  k("n", "K", function() vim.lsp.buf.hover() end, opts)
  k("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  k("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  k("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  k("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  k("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  k("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  k("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  k("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities())

require("fidget").setup({})
require("mason").setup({
    ensure_installed = {
      "debugpy",
    }
  }
)
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "tsserver",
    "pyright",
  },
  handlers = {
    function(server_name) -- default handler (optional)

      require("lspconfig")[server_name].setup {
        capabilities = capabilities
      }
    end,

    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" },
            }
          }
        }
      }
    end,
  }
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
      { name = 'buffer' },
    })
})

vim.diagnostic.config({
  -- update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.diagnostic.config({
    virtual_text = true
})

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

lsp.setup()
