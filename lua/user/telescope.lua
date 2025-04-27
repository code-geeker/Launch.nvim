local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-lua/plenary.nvim" },
    { "code-geeker/nvim-telescope-ctags-plus" },
    { "fcying/telescope-ctags-outline.nvim" },
    {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
    },
   { "nvim-telescope/telescope-frecency.nvim" }
  },
}

function M.config()

_G.smart_grep = function()
  local mode = vim.fn.mode()
  -- 如果是 VISUAL 模式，或者有视觉选区
  if mode == "v"  then
    require('telescope-live-grep-args.shortcuts').grep_visual_selection({ postfix = ' -i ' })
  else
      require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({ postfix = ' -i ' })
    -- 检查选区是不是实际存在
    --[[ local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")
    if vstart[2] ~= vend[2] or vstart[3] ~= vend[3] then
      require('telescope-live-grep-args.shortcuts').grep_visual_selection({ postfix = ' -i ' })
    else
        print("No selection")
      require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({ postfix = ' -i ' })
    end ]]
  end
end

  local wk = require "which-key"
  -- wk.add {
  --   ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
  --   ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  --   ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  --   ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  --   ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  --   ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  --   ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
  --   ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
  --   ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  -- }

  wk.add{
      { "<leader>w", "<cmd>lua smart_grep()<cr>", desc = "Word Smart Grep", mode = { "n", "v" } },
  }

  --[[ require("telescope").extensions.frecency.frecency {
	workspace = "CWD",
	path_display = { "shorten" },
	theme = "ivy",
      } ]]

  local icons = require "user.icons"
  local actions = require "telescope.actions"


  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      --[[ path_display = {
        filename_first = {
          reverse_directories = true,
        },
      }, ]]
      path_display = {
        "filename_first"
      },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },


    -- grep_previewer =  require("telescope.previewers").vimgrep.new,

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        find_command = { "rg", "--files", "--sortr=modified" },
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      -- planets = {
      --   show_pluto = true,
      --   show_moon = true,
      -- },
      --
      -- colorscheme = {
      --   enable_preview = true,
      -- },
      --
      -- lsp_references = {
      --   theme = "dropdown",
      --   initial_mode = "normal",
      -- },
      --
      -- lsp_definitions = {
      --   theme = "dropdown",
      --   initial_mode = "normal",
      -- },
      --
      -- lsp_declarations = {
      --   theme = "dropdown",
      --   initial_mode = "normal",
      -- },
      --
      -- lsp_implementations = {
      --   theme = "dropdown",
      --   initial_mode = "normal",
      -- },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      frecency = {
        show_scores = true, -- Default: false
        -- If `true`, it shows confirmation dialog before any entries are removed from the DB
        -- If you want not to be bothered with such things and to remove stale results silently
        -- set db_safe_mode=false and auto_validate=true
        --
        -- This fixes an issue I had in which I couldn't close the floating
        -- window because I couldn't focus it
        db_safe_mode = false, -- Default: true
        -- If `true`, it removes stale entries count over than db_validate_threshold
        auto_validate = true, -- Default: true
        -- It will remove entries when stale ones exist more than this count
        db_validate_threshold = 10, -- Default: 10
        -- Show the path of the active filter before file paths.
        -- So if I'm in the `dotfiles-latest` directory it will show me that
        -- before the name of the file
        show_filter_column = false, -- Default: true
      },

      ctags_outline = {
        --ctags option
        ctags = {'ctags'},
        --ctags filetype option
        ft_opt = {
          php = '--php-kinds=f',
        },
        sorting_strategy = 'ascending',
      },
      live_grep_args = {
        auto_quoting = true,
        mappings = { -- extend mappings
          i = {
            ["<M-q>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = ' -i ' }),
            -- freeze the current list and start a fuzzy search in the frozen list
            ["<M-f>"] = require('telescope.actions').to_fuzzy_refine
          },
        },
      },

    },
  }

  require('telescope').load_extension('ctags_plus')
  require("telescope").load_extension "frecency"
  require('telescope').load_extension('fzf')
  require("telescope").load_extension("live_grep_args")

  vim.api.nvim_command('highlight! link TelescopePathSeparator NONE')
end


return M
