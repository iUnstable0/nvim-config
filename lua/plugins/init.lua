local core = require("modules.core")

local debugger = core.load_module("debugger")

local string = core.load_module("string")
local table = core.load_module("table")

local plugins = {
	"folke/neodev.nvim",
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
}

local plugin_dir_path = vim.fn.stdpath("config") .. "/lua/plugins"

for _, plugin in pairs(vim.fn.systemlist({ "ls", plugin_dir_path })) do
	local plugin_path = plugin_dir_path .. "/" .. plugin

	if vim.fn.isdirectory(plugin_path) == 1 then
		for _, file in pairs(vim.fn.systemlist({ "ls", plugin_path })) do
			if vim.fn.filereadable(plugin_path .. "/" .. file) == 1 then
				local file_name = string.split(file, ".")[1]

				local success, props = pcall(require, "plugins." .. plugin .. "." .. file_name)

				local repository = plugin .. "/" .. file_name

				if success then
					if type(props) == "table" then
						if props.real_name then
							repository = plugin .. "/" .. props.real_name
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
	end
end

-- debugger.log(plugins)

return plugins
