local function set_iabbr(from, to)
	vim.cmd(string.format("iabbrev %s %s", from, to))
end

local function set_exp_iabbr(from, to)
	vim.cmd(string.format("iabbrev <expr> %s %s", from, to))
end

local function set_iabbrs(tbl)
	for from, data in pairs(tbl) do
		if type(data) == "table" then
			-- expr 옵션이 true이면 set_exp_iabbr 사용
			if data.expr then
				set_exp_iabbr(from, data.to)
			else
				set_iabbr(from, data.to)
			end
		else
			-- 단순한 축약어 처리
			set_iabbr(from, data)
		end
	end
end

set_iabbrs({
	teh = "the",
	adn = "and",
	becuase = "because",
	recieve = "receive",
	__time = { to = "strftime('(%Y-%m-%d %H:%M:%S)')", expr = true },
	__date = { to = "strftime('(%Y-%m-%d)')", expr = true },
	__file = { to = "expand('%:p')", expr = true }, -- full path
	__name = { to = "expand('%')", expr = true }, -- relative path
	__pwd = { to = "expand('%:p:h')", expr = true },
	__uuid = { to = "system('uuidgen')", expr = true },
})
