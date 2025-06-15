local M = {
 'akinsho/bufferline.nvim',
  version = "*",
  -- dependencies = 'nvim-tree/nvim-web-devicons'
}



function M.config()

  require("bufferline").setup{
      options = {
          numbers = "ordinal",
          separator_style = "slope",
          offsets = {
            {
              -- filetype = "NvimTree",
              -- filetype = "neo-tree",
              filetype = "snacks_layout_box",
              text = '󰙅  File Explorer',
              text_align = "left",
              separator = true,
            }
          },
      }
  }


end
return M
