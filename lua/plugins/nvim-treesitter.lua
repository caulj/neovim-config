return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",                  -- Ensures Parses stays updated
	event = { "BufReadPost", "BufNewFile" }, -- Load Treesitter on buffer events
	main = "nvim-treesitter.configs",
	opts = {
		-- Set Parser Settings
		auto_install = true,
		indent = { enable = false },
		highlight = {
			enable = true,                    -- Enable Treesitter Highlighting
			additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting for performance
		},
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	}
}
