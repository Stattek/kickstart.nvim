-- create a local table to hold our functions
local URL_HELPERS = {}

-- now we can define our functions:

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
function URL_HELPERS.gh(repo) return 'https://github.com/' .. repo end

-- return the table so other files can access it
return URL_HELPERS
