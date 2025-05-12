-- lazy
return {
    "ptdewey/yankbank-nvim",
    dependencies = "kkharji/sqlite.lua",
    config = function()
        require('yankbank').setup({
            -- other options...
            num_behavior = "jump",
            persist_type = "sqlite",
            max_entries = 20,
        })
    end,
}
