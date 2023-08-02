local core = require("modules.core")

local debugger = core.load_module("debugger")

local string = core.load_module("string")
local table = core.load_module("table")
local utils = core.load_module("utils")

local plugins = {
	"folke/neodev.nvim",
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
}

local plugin_dir_path = vim.fn.stdpath("config") .. "/lua/plugins"
-- debugger.log(utils.list_directory(plugin_dir_path))
-- print(vim.fs.dir(plugin_dir_path))

for plugin, _ in vim.fs.dir(plugin_dir_path, { depth = 2 }) do
	if _ == "file" and string.find(plugin, ".lua") and string.find(plugin, "/") then
		local plugin_path = string.split(plugin, "/")

		-- print(plugin_path:concat("."):split(".lua"):concat("."))

		local success, props = pcall(require, "plugins." .. plugin_path:concat("."):split(".lua")[1])

		-- print("plugins." .. plugin_path:concat("."):split(".lua")[1])

		local repository = string.split(plugin, ".lua")[1]

		if success then
			if type(props) == "table" then
				if props.real_name then
					repository = plugin_path[1] .. "/" .. props.real_name
				end

				-- debugger.log(table.inject({
				-- 	repository,
				-- }, props.options))

				table.insert(
					plugins,
					table.inject({
						repository,
					}, props.options)
				)
			else
				table.insert(plugins, repository)
			end
		end
	end
end

-- print("end")

-- for _, plugin in pairs(vim.fn.systemlist({ "ls", plugin_dir_path })) do
-- 	local plugin_path = plugin_dir_path .. "/" .. plugin

-- 	if vim.fn.isdirectory(plugin_path) == 1 then
-- 		for _, file in pairs(vim.fn.systemlist({ "ls", plugin_path })) do
-- 			if vim.fn.filereadable(plugin_path .. "/" .. file) == 1 then
-- 				local file_name = string.split(file, ".")[1]

-- 				local success, props = pcall(require, "plugins." .. plugin .. "." .. file_name)

-- 				local repository = plugin .. "/" .. file_name

-- 				if success then
-- 					if type(props) == "table" then
-- 						if props.real_name then
-- 							repository = plugin .. "/" .. props.real_name
-- 						end

-- 						-- debugger.log(table.inject({
-- 						-- 	repository,
-- 						-- }, props.options))

-- 						table.insert(
-- 							plugins,
-- 							table.inject({
-- 								repository,
-- 							}, props.options)
-- 						)
-- 					else
-- 						table.insert(plugins, repository)
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- end

-- debugger.log(plugins)

-- return

return plugins
