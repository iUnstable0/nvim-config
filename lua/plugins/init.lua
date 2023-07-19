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
				table.insert(plugins, plugin .. "/" .. file)
			end
		end
	end
end

return plugins
