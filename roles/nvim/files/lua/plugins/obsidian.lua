local function get_vaults()
  local vaults = {}
  local path = vim.fn.expand("~/notes")
  local handle = vim.uv.fs_scandir(path)
  if handle then
    while true do
      local name, type = vim.uv.fs_scandir_next(handle)
      if not name then
        break
      end
      if type == "directory" then
        table.insert(vaults, { name = name, path = path .. "/" .. name })
      end
    end
  end
  return vaults
end

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = get_vaults(),
  },
}
