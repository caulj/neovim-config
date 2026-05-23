return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "<leader>dd", ":Neotree toggle<CR>",     desc = "Open Nvim Tree" },
		{ "<leader>df", ":Neotree focus<CR>",      desc = "Focus Nvim Tree" },
		{ "<leader>db", ":Neotree buffers<CR>",    desc = "Open Buffers" },
		{ "<leader>dg", ":Neotree git_status<CR>", desc = "Open Git Status" },
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = false,
		enable_diagnostics = true,
		default_component_configs = {},
		window = {
			width = 30,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,     -- show hidden files
			},
			hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
			-- in whatever position is specified in window.position
			-- "open_current",  -- netrw disabled, opening a directory opens within the
			-- window like netrw would, regardless of window.position
			-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		},
		source_selector = {
			winbar = true,
			statusline = false,
		},
	},
}
