return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	cmd = "Telescope", -- Lazy-load when the :Telescope command is used
	keys = {
		{ "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>fg", ":Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers" },
		{ "<leader>b", ":Telescope buffers<CR>", desc = "Show Buffers" },
		{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Find Help" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down with Ctrl + J
					["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up with Ctrl + K
				},
			},
		},
		pickers = {
			buffers = {
				sort_lastused = true, -- Sort buffers by last used
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	init = function()
		require("telescope").load_extension("fzf")
	end,
}
