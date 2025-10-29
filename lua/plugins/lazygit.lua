return {
	-- LazyGit integration
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			{ "<A-g>", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit", mode = { "n", "i", "v", "t" } },
		},
	},
}
