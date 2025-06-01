local M = {
  "yegappan/taglist",
  event = "VeryLazy",
}

function M.config()
  -- require("taglist").setup {}
  vim.g.Tlist_Use_Right_Window = 1
  vim.g.Tlist_Show_One_File = 1
  vim.g.Tlist_Exit_OnlyWindow = 1
  vim.g.Tlist_Display_Tag_Scope = 0
  vim.g.Tlist_Display_Prototype = 1
  vim.g.Tlist_WinWidth = 55

end

return M
