return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local tailwindcss_colorizer = require("tailwindcss-colorizer-cmp") -- Import the tailwind colorizer plugin
			local v = vim

			-- Set up the tailwindcss-colorizer-cmp
			tailwindcss_colorizer.setup({ color_square_width = 2 })

			-- Add this section to extend filetypes
			require("luasnip").filetype_extend("javascriptreact", { "html" })
			require("luasnip").filetype_extend("typescriptreact", { "html" })
			-- load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			local has_words_before = function()
				local line, col = table.unpack(v.api.nvim_win_get_cursor(0))
				return col ~= 0
					and v.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local function jumpable(dir)
				local luasnip_ok, luasnip = pcall(require, "luasnip")
				if not luasnip_ok then
					return false
				end

				local win_get_cursor = v.api.nvim_win_get_cursor
				local get_current_buf = v.api.nvim_get_current_buf

				---sets the current buffer's luasnip to the one nearest the cursor
				---@return boolean true if a node is found, false otherwise
				local function seek_luasnip_cursor_node()
					-- TODO(kylo252): upstream this
					-- for outdated versions of luasnip
					if not luasnip.session.current_nodes then
						return false
					end

					local node = luasnip.session.current_nodes[get_current_buf()]
					if not node then
						return false
					end

					local snippet = node.parent.snippet
					local exit_node = snippet.insert_nodes[0]

					local pos = win_get_cursor(0)
					pos[1] = pos[1] - 1

					-- exit early if we're past the exit node
					if exit_node then
						local exit_pos_end = exit_node.mark:pos_end()
						if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
							snippet:remove_from_jumplist()
							luasnip.session.current_nodes[get_current_buf()] = nil

							return false
						end
					end

					node = snippet.inner_first:jump_into(1, true)
					while node ~= nil and node.next ~= nil and node ~= snippet do
						local n_next = node.next
						local next_pos = n_next and n_next.mark:pos_begin()
						local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
							or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

						-- Past unmarked exit node, exit early
						if n_next == nil or n_next == snippet.next then
							snippet:remove_from_jumplist()
							luasnip.session.current_nodes[get_current_buf()] = nil

							return false
						end

						if candidate then
							luasnip.session.current_nodes[get_current_buf()] = node
							return true
						end

						local ok
						ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
						if not ok then
							snippet:remove_from_jumplist()
							luasnip.session.current_nodes[get_current_buf()] = nil

							return false
						end
					end

					-- No candidate, but have an exit node
					if exit_node then
						-- to jump to the exit node, seek to snippet
						luasnip.session.current_nodes[get_current_buf()] = snippet
						return true
					end

					-- No exit node, exit from snippet
					snippet:remove_from_jumplist()
					luasnip.session.current_nodes[get_current_buf()] = nil
					return false
				end

				if dir == -1 then
					return luasnip.in_snippet() and luasnip.jumpable(-1)
				else
					return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
				end
			end

			cmp.setup({
				formatting = {
					format = tailwindcss_colorizer.formatter, -- Use tailwindcss-colorizer-cmp formatter
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- not work
					-- ["<C-d>"] = cmp.mapping.scroll_docs(4), -- not work
					["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif jumpable(1) then
							luasnip.jump(1)
						elseif has_words_before() then
							-- cmp.complete()
							fallback()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-i>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				-- autocompletion sources
				sources = cmp.config.sources({
					-- { name = "cmp_luasnip" }, -- <-- 스니펫 소스를 버퍼 소스보다 위로 이동
					{ name = "nvim_lsp" }, -- lsp
					{ name = "luasnip", max_item_count = 3 }, -- snippets
					{ name = "buffer", max_item_count = 5 }, -- text within current buffer
					{ name = "path", max_item_count = 3 }, -- file system paths
					{ name = "render-markdown" },
				}),
			})
		end,
	},
}
