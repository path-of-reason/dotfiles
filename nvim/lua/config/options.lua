local opt = vim.opt

-- vim.o.winwidth = 80
-- vim.o.winheight = 80
-- tab indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true
opt.ignorecase = false
opt.smartcase = true

-- visual
-- opt.relativenumber = true
opt.number = true
opt.termguicolors = true
opt.signcolumn = "yes"

--- etc
opt.encoding = "UTF-8"
opt.cmdheight = 1
opt.scrolloff = 10
opt.mouse:append("a")

-- markdown link
opt.conceallevel = 2

---
vim.diagnostic.config({
	-- virtual_text = { current_line = true },
	virtual_lines = { current_line = true },
})
