return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		whitespace = {
			remove_blankline_trail = true,
		},
		indent = {
			char = { "▏" },
			highlight = { "LineNr" },
		},
		exclude = {
			filetypes = { "help", "startify", "dashboard" }, -- Exclude specific filetypes
			buftypes = { "terminal", "nofile" }, -- Exclude specific buffer types
		},
		scope = {
			enabled = false, -- Optional: Highlight indentation scopes
			show_start = false, -- Show the start of the scope
			show_end = false, -- Hide the end of the scope
		},
	},
}
