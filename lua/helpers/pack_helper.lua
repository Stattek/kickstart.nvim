---@module 'pack_helper' Simple setup functions for Neovim's vim.pack
---        plugin manager.

local M = {}

---Adds a simple package to vim.pack.
---@param repo string
---@param package_name string
function M.vim_pack_add_simple(repo, package_name)
  vim.pack.add { repo }
  require(package_name).setup {}
end

return M
