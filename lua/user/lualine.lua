local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      icons_enabled = true,

      -- component_separators = { left = '', right = ''},
      component_separators = { left = '', right = '|'},
      section_separators = { left = '', right = ''},
      ignore_focus = { "neo-tree" },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1
        },
      },

      -- lualine_x = {  'encoding', 'fileformat', 'filetype'},

      lualine_x = {
        function()
          return require("codeium.virtual_text").status_string()
        end,
        'encoding', 'fileformat', 'filetype'
      },
      lualine_y = { require("recorder").displaySlots,require("recorder").recordingStatus },
      lualine_z = {"progress",'location'}

    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
