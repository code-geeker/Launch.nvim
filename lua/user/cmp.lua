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
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()

  local lspkind = require "lspkind"

  -- gray
  vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
  -- blue
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
  -- light blue
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
  vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
  -- pink
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
  -- front
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })


  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local icons = require "user.icons"

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
          -- require("neotab").tabout()
        else
          fallback()
          -- require("neotab").tabout()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    --[[ formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        return vim_item
      end,
    }, ]]


    formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol_text"})


        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          cmp_tabnine = "[TN]",
          path = "[Path]",
          luasnip = "[SNIP]",
          rg = "[RG]",
          tags = "[TAGS]",
        })[entry.source.name]


        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.labelDetails or {}).detail
          vim_item.kind = ""
          if detail and detail:find('.*%%.*') then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "cmp_tabnine" },
      { name = "nvim_lua",
        option = {
          php = {
            keyword_pattern = [=[[\%(\$\k*\)\|\k\+]]=],
          }
        } },
      { name = "buffer" },
      { name = "path" },
      { name = 'rg', option = { additional_arguments = "--smart-case" } },
      {
        name = "tags",
        option = {
          -- Delayed time after user input, in milliseconds.
          complete_defer = 100,
          -- Max items when searching `taglist`.
          max_items = 10,
          -- Use exact word match when searching `taglist`, for better searching
          -- performance.
          exact_match = false,
          -- Prioritize searching result for current buffer.
          current_buffer_only = false,
        },
      },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = "rounded",
        scrollbar = false,
      },
      documentation = {
        border = "rounded",
      },
    },
    experimental = {
      ghost_text = false,
    },
  }
end

return M
