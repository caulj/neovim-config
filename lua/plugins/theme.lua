return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- Set Colorscheme
		local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-storm')
		if not ok then
			vim.cmd 'colorscheme default' -- if the above fails, then use default
		end
	end,
}
