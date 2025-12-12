local M = {}

function M.insert_separator()
  local col_position = vim.fn.indent(vim.fn.line(".")) + 1

  local comment_string = vim.bo.commentstring or ""
  local comment_prefix = comment_string:gsub("%%s.*$", "")

  if #comment_prefix == 0 then
    comment_prefix = "# "
  end

  local total_width = 80
  local prefix_length = #comment_prefix

  local used_width = col_position - 1

  local dash_count = total_width - used_width - prefix_length

  if dash_count < 1 then
    dash_count = 0
  end

  local dashes = string.rep("-", dash_count)
  local white_space = string.rep(" ", col_position - 1)
  local separator_line = white_space .. comment_prefix .. dashes

  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { separator_line })
end

M.setup = function()
  vim.api.nvim_create_user_command("BreakLine", M.insert_separator, {
    desc = "Insert 80-char horizontal separator",
    nargs = 0,
  })
end

return M
