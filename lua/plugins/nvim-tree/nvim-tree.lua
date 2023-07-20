return {
	real_name = "nvim-tree.lua",
	options = {
		config = function()
			require("nvim-tree").setup()
		end,
	},
}
