local api = vim.api
local buf, win

local function center(str)
  local width = api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(' ', shift) .. str
end

local function open_window()
  buf = api.nvim_create_buf(false, true)
  local border_buf = api.nvim_create_buf(false, true)

  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  api.nvim_buf_set_option(buf, 'filetype', 'whid')

  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  local win_height = math.ceil(height * 0.6 - 4)
  local win_width = math.ceil(width * 0.6)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local border_opts = {
    style = "minimal",
    relative = "editor",
    width = win_width + 2,
    height = win_height + 2,
    row = row - 1,
    col = col - 1
  }

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }

  local border_lines = { '╔' .. string.rep('═', win_width) .. '╗' }
  local middle_line = '║' .. string.rep(' ', win_width) .. '║'
  for i = 1, win_height do
    table.insert(border_lines, middle_line)
  end
  table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')
  api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

  local border_win = api.nvim_open_win(border_buf, true, border_opts)
  win = api.nvim_open_win(buf, true, opts)
  api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "' .. border_buf)

  api.nvim_win_set_option(win, 'cursorline', true) -- it highlight line with the cursor on it

  -- we can add title already here, because first line will never change
  api.nvim_buf_set_lines(buf, 0, -1, false, { center('Django Nvim'), '', '' })
  api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
end

local function update_view()
  -- command and return result as list
  local result = vim.fn.systemlist('git ls-tree -d -r master --name-only') --gets folders

  -- with small indentation results will look better
  for k, v in pairs(result) do
    result[k] = '  ' .. result[k]
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, result)
end

return {
  update_view = update_view,
}
