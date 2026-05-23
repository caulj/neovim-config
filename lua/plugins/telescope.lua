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

	cmd = "Telescope",

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find Buffers" },
		{ "<leader>b",  "<cmd>Telescope buffers<CR>",    desc = "Show Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Find Help" },
	},

	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},

			pickers = {
				find_files = {
					-- hidden = true
				},
				buffers = {
					sort_lastused = true,
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
		}
	end,

	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		pcall(telescope.load_extension, "fzf")
	end,
}
