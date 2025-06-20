local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- keymap("n", "n", "nzz", opts)
-- keymap("n", "N", "Nzz", opts)
-- keymap("n", "*", "*zz", opts)
-- keymap("n", "#", "#zz", opts)

-- search movement keeps cursor in middle
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)



keymap("n", "#", "*``", opts)
keymap("n", "*", "#``", opts)


keymap('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', opts)


-- keymap("n", "g*", "g*zz", opts)
-- keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
-- vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]

-- vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
-- keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

-- going back to normal mode which works even in vim's terminal
-- eg: you may need this if you use floaterm to escape terminal
-- vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

keymap("n", "cc", ":bp|bd #<CR><ESC>", opts)


keymap("n", "ycc", function()
    return 'yy' .. vim.v.count1 .. "gcc']p"
end, { remap = true, expr = true })


-- 已放到wk配置
-- keymap("n", "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", opts)
-- keymap("n", "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", opts)
-- keymap("n", "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", opts)
-- keymap("n", "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", opts)
-- keymap("n", "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", opts)
-- keymap("n", "<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>", opts)
-- keymap("n", "<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>", opts)
-- keymap("n", "<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>", opts)
-- keymap("n", "<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>", opts)

-- 已放到wk配置
-- keymap("n", "<leader>h", ":BufferLineCyclePrev<CR>", opts)
-- keymap("n", "<leader>l", ":BufferLineCycleNext<CR>", opts)


-- keymap({ "n", "o", "x" }, "<esc>", ":noh<CR>", opts)


keymap("n", "ww", ":write!<CR>", opts)
-- keymap("n", "<CR>", ":write!<CR>", opts)

-- keymap("n", "yr", '<cmd>let @*=expand("%")<CR>:echo expand("%") "is yanked to clipboard"<CR>', opts)


-- vertical movement keeps cursor in middle
-- keymap('n', '<C-d>', '<C-d>zz', opts)
-- keymap('n', '<C-u>', '<C-u>zz', opts)

-- vertical movement keeps cursor in middle (visual mode)
-- keymap('v', '<C-d>', '<C-d>zz', opts)
-- keymap('v', '<C-u>', '<C-u>zz', opts)


-- indent and outdent lines quickly
keymap('n', '<TAB>', '>>', opts)
keymap('n', '<S-TAB>', '<<', opts)
-- indent and outdent lines in visual mode
keymap('v', '<TAB>', '<S->>gv', opts)
keymap('v', '<S-TAB>', '<S-<>gv', opts)


-- move lines around
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- keep cursor at front when appending lines below
-- keymap('n', 'J', 'mzJ`z', opts)
keymap('n', 'J', 'mzJ`z:delmarks z<cr>', opts)

-- creates a new line below the cursor and goes back into normal mode
-- keymap('n', '<CR>', 'o<Esc>', opts)


keymap({ "n", "o", "x" }, "<C-]>", "<cmd>lua require('picker-tags').tags()<cr>", opts)

-- keymap('n', '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", opts)

keymap('i', 'jj', '<Esc>', opts)


-- TIP: Disable arrow keys in normal mode
keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

keymap('n', ',m', ":%s/<C-V><cr>//ge<cr>'tzt'm")
keymap('n', '<c-z>', "<nop>")



local dd = function()
		if vim.api.nvim_get_current_line():match("^%s*$") then
			return '"_dd'
		else
			return "dd"
		end
	end
keymap("n", "dd", dd, { noremap = true, expr = true })

keymap('n', ';', ':')
