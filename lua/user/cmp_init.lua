local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    -- {
    --   "hrsh7th/cmp-emoji",
    --   event = "InsertEnter",
    -- },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "onsails/lspkind.nvim",
    },
    {
      "lukas-reineke/cmp-rg",
    },
    --[[ {
      "delphinus/cmp-ctags",
    } ]]
    {
      "quangnguyen30192/cmp-nvim-tags"
    },

  },
}

function M.config()
local cmp = require'cmp'

  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- cmp.select_next_item()
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
			sources = {
				{ name = "nvim_lsp_signature_help", group_index = 1 },
        { name = "cmp_tabnine",             max_item_count = 5,  group_index = 1 },
				{ name = "luasnip",                 max_item_count = 5,  group_index = 1 },
				{ name = "nvim_lsp",                max_item_count = 10, group_index = 1 },
				{ name = "nvim_lua",                group_index = 1 },
				{ name = "cmp_tabnine",             max_item_count = 5, group_index = 1 },
				{ name = "vim-dadbod-completion",   group_index = 1 },
				{ name = "path",                    group_index = 2 },
				{ name = "buffer",                  keyword_length = 2,  max_item_count = 5, group_index = 1 },
      { name = 'rg', option = { additional_arguments = "--smart-case"},  max_item_count = 5, group_index = 1  },
      {
        name = "tags",
        option = {
          -- Delayed time after user input, in milliseconds.
          complete_defer = 100,
          -- Max items when searching `taglist`.
          max_items = 5,
          -- Use exact word match when searching `taglist`, for better searching
          -- performance.
          exact_match = false,
          -- Prioritize searching result for current buffer.
          current_buffer_only = false,
        },
          max_item_count = 5,
          group_index = 1
      },
			},
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }

end

return M
