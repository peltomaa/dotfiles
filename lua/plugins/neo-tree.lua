return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>fe", function()
			require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
		end, { desc = "Explorer NeoTree (cwd)" })

		vim.keymap.set("n", "<leader>fE", function()
			require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
		end, { desc = "Explorer NeoTree (cwd)" })

		vim.keymap.set("n", "<leader>e", "<leader>fe", { desc = "Explorer NeoTree (cwd)", remap = true })

		vim.keymap.set("n", "<leader>E", "<leader>fE", { desc = "Explorer NeoTree (cwd)", remap = true })

		vim.keymap.set("n", "<leader>ge", function()
			require("neo-tree.command").execute({ source = "git_status", toggle = true })
		end, { desc = "Git Explorer" })

		vim.keymap.set("n", "<leader>be", function()
			require("neo-tree.command").execute({ source = "buffers", toggle = true })
		end, { desc = "Buffer Explorer" })

		local function map_window_keys()
			return {
				["l"] = "open", -- Open the selected node/file
				["h"] = "close_node", -- Close the currently expanded directory
				["<space>"] = "none", -- Disable default space key mapping
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c") -- Copy file path to system clipboard
					end,
					desc = "Copy Path to Clipboard",
				},
				["O"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.system({ "xdg-open", path }) -- Open with the system's default application
					end,
					desc = "Open with System Application",
				},
				["P"] = { "toggle_preview", config = { use_float = false } }, -- Toggle file preview
			}
		end

		require("neo-tree").setup({
			window = {
				mappings = map_window_keys(),
			},
		})
	end,
}
