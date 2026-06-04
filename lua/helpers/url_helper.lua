---@module 'url_helper' Simple helper functions for creating plugin
---        repository links, e.g. for GitHub.

local M = {}

-- now we can define our functions:

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
function M.gh(repo) return 'https://github.com/' .. repo end

-- return the table so other files can access it
return M
