local M = {
  "nvim-tree/nvim-web-devicons",
  -- event = "VeryLazy",
}

function M.config()
  require'nvim-web-devicons'.setup {
    override_by_extension = {
      ["blade.php"] = {
        color = "#a074c4",
        cterm_color = "140",
        icon = "",
        name = "Blade"
      },

    };
  }
end

return M
