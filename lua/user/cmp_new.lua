return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"windwp/nvim-autopairs",
		"onsails/lspkind-nvim",
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "lukas-reineke/cmp-rg",
    },
    {
      "quangnguyen30192/cmp-nvim-tags"
    },
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")
		luasnip.config.setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})
		-- add vscode exported completions
    require("luasnip.loaders.from_vscode").lazy_load()

		local lsp_kind = require("lspkind")
		local cmp_next = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end
		local cmp_prev = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end

		lsp_kind.init()
		---@diagnostic disable-next-line
		cmp.setup({
			enabled = true,
			preselect = cmp.PreselectMode.None,
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
				}),
			},
			---@diagnostic disable-next-line
			view = {
				entries = "bordered",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
    formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = lsp_kind.symbolic(vim_item.kind, {mode = "symbol_text"})

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
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<S-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<tab>"] = cmp_next,
				["<down>"] = cmp_next,
				["<C-p>"] = cmp_prev,
				["<up>"] = cmp_prev,
			},
			sources = {
				{ name = "nvim_lsp_signature_help", group_index = 1 },
        { name = "cmp_tabnine",             max_item_count = 5,  group_index = 1 },
				{ name = "luasnip",                 max_item_count = 5,  group_index = 1 },
				{ name = "nvim_lsp",                max_item_count = 10, group_index = 1 },
				{ name = "nvim_lua",                group_index = 1 },
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
		local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		if not presentAutopairs then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
