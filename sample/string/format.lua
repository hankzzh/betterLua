local readme = [[
	string.format 功能比较复杂，调用的是c function，lua调用c比较消耗性能
	.. 连接符是lua运算符
	不影响可读性的情况下用字符串连接符更好
]]


return {
	readme = readme,
	function()
		for i = 1, max_tab_size do
			local a = 'a' .. 'n' .. 'b' .. 'm' .. 'c'
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = string.format('%sn%sm%s', 'a', 'b', 'c')
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = string.format('%06x', 123456)
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = ConvertDec2X(123456)
		end
	end,
}
