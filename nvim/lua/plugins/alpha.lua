return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"",
			"",
			"     ...    .     ...         .       .x+=:.                                   _            .                        ",
			'  .~`"888x.!**h.-``888h.     @88>    z`    ^%                                 u            @88>                      ',
			" dX   `8888   :X   48888>    %8P        .   <k                   u.    u.    88Nu.   u.    %8P      ..    .     :    ",
			"'888x  8888  X88.  '8888>     .       .@8Ned8\"                 x@88k u@88c. '88888.o888c    .     .888: x888  x888.  ",
			'\'88888 8888X:8888:   )?""`  .@88u   .@^%8888"                 ^"8888""8888"  ^8888  8888  .@88u  ~`8888~\'888X`?888f` ',
			" `8888>8888 '88888>.88h.   ''888E` x88:  `)8b.                  8888  888R    8888  8888 ''888E`   X888  888X '888>  ",
			"   `8\" 888f  `8888>X88888.   888E  8888N=*8888                  8888  888R    8888  8888   888E    X888  888X '888>  ",
			'  -~` \'8%"     88" `88888X   888E   %8"    R88                  8888  888R    8888  8888   888E    X888  888X \'888>  ',
			"  .H888n.      XHn.  `*88!   888E    @8Wou 9%     88888888      8888  888R   .8888b.888P   888E    X888  888X '888>  ",
			' :88888888x..x88888X.  `!    888&  .888888P`      88888888     "*88*" 8888"   ^Y8888*""    888&   "*88%""*88" \'888!` ',
			' f  ^%888888% `*88888nx"     R888" `   ^"F                       ""   \'Y"       `Y"        R888"    `~    "    `"`   ',
			'      "**"`    "**""        ""                                                            ""                       ',
			"",
			"",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "󰈔  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱼  > Find file", ":cd $HOME/Documents/ | Telescope find_files<CR>"),
			dashboard.button("t", "󰊄  > Find text", ":Telescope live_grep <CR>"),
			dashboard.button("m", "󰃃  > BookMarks", ":Telescope marks <CR>"),
			dashboard.button("r", "󰄉  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "󰒓  > Settings", ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
			dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.relativenumber = false
			end,
		})
	end,
}
