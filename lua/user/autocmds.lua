--[[ vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd "syntax sync fromstart"
  end,
}) ]]

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "!vim" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 160 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})


-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   desc = "Automatically remove trailing blank lines",
--   command = [[%s/\(\n\s*\)\+\%$//e]],
-- })


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.php", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


vim.cmd[[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]


--[[ vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  desc = "",
  command = "let @/ = ''",
}) ]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snipe-menu",
  callback = function(args)
    -- 绑定 WinLeave 事件（不限制单次触发）
    vim.api.nvim_create_autocmd("WinLeave", {
      buffer = args.buf,
      callback = function()
        if vim.bo.filetype == "snipe-menu" then
          vim.api.nvim_win_close(0, true) -- 强制关闭窗口
        end
      end,
    })
  end,
})


function PhpHelp()
  local word = vim.fn.expand("<cword>")
  local ok, _ = pcall(vim.cmd, "help " .. word)
  if not ok then
    vim.notify("No help available for: " .. word, vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua PhpHelp()<CR>", { noremap = true, silent = true })
  end,
})


vim.api.nvim_create_user_command('TSNodeInfo', function()
    local ts_utils = require('nvim-treesitter.ts_utils')
    local node = ts_utils.get_node_at_cursor()
    if node then
        print("Node type:", node:type())
        print("Node text:", vim.treesitter.get_node_text(node, 0))
    else
        print("No node found under cursor")
    end
end, {})
