
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  version = '*',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
}

local function copy_path(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		modify(filepath, ":."),
		filepath,
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	vim.ui.select({
		"1. Path relative to CWD: " .. results[1],
    "2. Absolute path: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}, { prompt = "Choose to copy to clipboard:" }, function(choice)
		if choice then
			local i = tonumber(choice:sub(1, 1))
			if i then
				local result = results[i]
				vim.fn.setreg('*', result)
				vim.notify("Copied: " .. result)
			else
				vim.notify("Invalid selection")
			end
		else
			vim.notify("Selection cancelled")
		end
	end)
end

function M.config()
  local wk = require "which-key"
  wk.add{
    { "<leader>e", "<cmd>Neotree toggle reveal<CR>", desc = "Explorer", icon = "󰙅"},
  }

  require("neo-tree").setup({
    window = {
      mappings = {
        ["Y"] = copy_path,
        ["<tab>"] = "open",

        -- Additional mappings
      },
    }
  })


  vim.api.nvim_command('highlight! NeoTreeDirectoryIcon guifg=#8094b4')

end

return M
