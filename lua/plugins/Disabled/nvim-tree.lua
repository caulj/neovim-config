return {
	"nvim-tree/nvim-tree.lua",

	enabled = false,

	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
    	{ "<leader>dd", ":NvimTreeToggle<CR>", 	  desc = "Open Nvim Tree"         },
    	{ "<leader>dF", ":NvimTreeFindFile<CR>",  desc = "Find File in Nvim Tree" },
		{ "<leader>df", ":NvimTreeFocus<CR>",     desc = "Focus Nvim Tree"        },
	},
	opts = {
		auto_reload_on_write = true,
		diagnostics = {
			enable = true,
        	show_on_dirs = true,
		}
	},
}
