local SIMPLE_SETUP = {}

---Adds a simple package to vim.pack.
---@param repo string
---@param package_name string
function SIMPLE_SETUP.vim_pack_add_simple(repo, package_name)
  vim.pack.add { repo }
  require(package_name).setup {}
end

return SIMPLE_SETUP
