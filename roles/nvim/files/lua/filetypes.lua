vim.filetype.add({
  filename = {
    ["config"] = function(path, bufnr)
      if path:match("wofi/config") then
        return "conf"
      end
    end,
  },
})
