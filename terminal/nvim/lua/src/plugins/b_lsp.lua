-- new lsp attempt
local M = {
  "neovim/nvim-lspconfig", -- Specify the plugin repository
  dependencies = {
    -- manage language servers
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- manage formatting
    "stevearc/conform.nvim",
    -- manage completion and snippets
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    -- local lspconfig = require("lspconfig") -- if you need it

    -- lsp stuff here
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    -- mason for installing language servers
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "pyright",
        "ts_ls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    -- confrom for formatting
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        python = { "black", "isort" },
      },
      formatters = {
        stylua = {
          args = {
            "--indent-type",
            "Spaces", -- Specify space-based indentation
            "--indent-width",
            "2", -- Set the width to 2 spaces
            "-", -- Read from stdin
          },
        },
      },
    })
    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })

    -- cmp for code completion
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-w>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<A-e>"] = cmp.mapping.select_next_item(cmp_select),
        ["<A-s>"] = cmp.mapping.confirm({ select = true }),
        ["<leader><leader>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        -- { name = 'buffer' },
        {
          name = "buffer",
          keyword_length = 5,
          option = {
            get_bufnrs = function()
              return { vim.api.nvim_get_current_buf() }
            end,
          },
        },
      }),
    })
  end,
}

return M
