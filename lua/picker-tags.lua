local M = {}

function buf_vtext()
  local a_orig = vim.fn.getreg('a')
  local mode = vim.fn.mode()
  if mode ~= 'v' and mode ~= 'V' then
    vim.cmd([[normal! gv]])
  end
  vim.cmd([[silent! normal! "aygv]])
  local text = vim.fn.getreg('a')
  vim.fn.setreg('a', a_orig)
  return text
end

function visual_or_cword()
  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' then
    return buf_vtext()
  end
  return vim.fn.expand('<cword>')
end

local  format = require("snacks.picker.format")


function M.tags()
  -- vim.notify(vim.inspect(vim.fn.tagfiles()), vim.log.levels.INFO)

  local word = visual_or_cword()
  -- vim.notify(word, vim.log.levels.INFO)
  local tags = vim.fn.taglist('^' .. word .. '$')
  -- print(vim.inspect(tags))

  if #tags == 1 then
    vim.cmd('tag ' .. word)
    return
  end
  if #tags == 0 then
    vim.notify("No tags found for: " .. word, vim.log.levels.WARN)
    return
  end

  --[[ -- Get tag file
  local tagfiles = vim.fn.tagfiles()
  for i, ctags_file in ipairs(tagfiles) do
    tagfiles[i] = vim.fn.expand(ctags_file, true)
  end
  -- Raise error if there is no tags file
  if vim.tbl_isempty(tagfiles) then
    vim.notify("No tags files found", vim.log.levels.WARN)
    return
  end ]]

  -- vim.notify(vim.inspect(tags), vim.log.levels.INFO)

  local items = {}
  local temp_bufs = {}

for _, tag in ipairs(tags) do
    ---@type snacks.picker.finder.Item
    ---@diagnostic disable-next-line: missing-fields

    local item = {}
    item = {
      -- text = Snacks.picker.util.text(tag, { "name", "kind" }),
      -- text = Snacks.picker.util.text(tag, {"filename"}),
      text = vim.fn.fnamemodify(tag.filename, ':.'),
      name = tag.name,
      kind = tag.kind,
      tag = tag,
      file = tag.filename,

      resolve = function() -- this is kinda expensive, since we have to open a buffer to search for the location of the tag
        local scratch_buf
        if temp_bufs[tag.filename] == nil
        then
          scratch_buf = vim.api.nvim_create_buf(false, true)
          temp_bufs[tag.filename] = scratch_buf
          local ei = vim.o.eventignore
          vim.o.eventignore = "all"
          vim.bo[scratch_buf].filetype = "snacks_picker_tags"
          vim.o.eventignore = ei
          local file = io.open(tag.filename, "r")
          if not file then
            print("Could not open file: " .. tag.filename)
            return
          end
          local content = file:read("*a")
          file:close()

          vim.api.nvim_buf_set_lines(scratch_buf, 0, -1, false, vim.split(content, "\n"))
        else
          scratch_buf = temp_bufs[tag.filename]
        end
        vim.api.nvim_buf_call(scratch_buf, function()
          local search_cmd = string.gsub(string.gsub(tag.cmd, '^/', '\\M'), '/$', '')
          local search_res = vim.fn.searchpos(search_cmd, 'n')
          local line, col = search_res[1], search_res[2]
          local search_name_res = vim.fn.searchpos(
            '\\%' .. tostring(line) .. 'l'    -- search on the line from tag.cmd
            .. '\\%>' .. tostring(col) .. 'c' -- search on the col from tag.cmd
            .. tag.name, 'n'
          )
          local col_start = search_name_res[2]
          local col_end = col_start + vim.fn.strdisplaywidth(tag.name, col_start)
          local max_col = vim.fn.strdisplaywidth(vim.tbl_get(vim.api.nvim_buf_get_text(scratch_buf, line-1, 0, line-1, -1, {}), 1) or "")
          local col_start_2 = col_start - 1
          local col_end_2
          if col_start_2 < 0 then col_end_2 = col_end else col_end_2 = col_end - 1 end
          col_end_2 = math.min(max_col, col_end_2)

          item.line = line
          item.pos = { line, math.max(0, col_start_2) }
          item.end_pos = { line, math.max(0, col_end_2) }
          return item
        end)
      end,
    }
    items[#items + 1] = item
  end
  for _, tmp_buf in pairs(temp_bufs) do
    vim.api.nvim_buf_delete(tmp_buf, {})
  end

  -- print(vim.inspect(items), vim.log.levels.INFO)
  -- return items

 Snacks.picker.pick({
    -- source = "select",
    title="Tags for: " .. word,
    items = items,
    matcher = {
      fuzzy = false,
    },
    format = function(item, picker)
      
         return format.filename(item, picker)


      --[[ local ret = {} ---@type snacks.picker.Highlight[]
      local tag = item.tag
      ret[#ret + 1] = { tag.kind, "Type" }
      ret[#ret + 1] = { "::", "SnacksPickerDelim" }
      -- ret[#ret + 1] = { tag.name }
      -- ret[#ret + 1] = { ":", "SnacksPickerDelim" }
      ret[#ret + 1] = { vim.fn.fnamemodify(tag.filename, ':.'), "SnacksPickerDirectory" }
      return ret ]]
    end,
    layout = {
      preset = "vertical",
      reverse = true,
      layout = {
        backdrop = false,
        width = 0.5,
        min_width = 80,
        height = 0.8,
        min_height = 30,
        box = "vertical",
        {
          win = "preview",
          title = "{preview:Preview}",
          border = "rounded",
          title_pos = "center",
        },
        {
          box = "vertical",
          border = "none",
          title_pos = "center",
          height = 0.2,
          { win = "list", title = " Results ", title_pos = "center", border = "rounded", },
          { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
        },

      },
    },
  })
end


return M
