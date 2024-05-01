function format(a, b, c)
	return a..'n'..b..'m'..c
end

return {
	function()
		for i = 1, max_tab_size do
			local a = 'a' .. 'n' .. 'b' .. 'm' .. 'c'
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = format('%sn%sm%s', 'a', 'b', 'c')
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = string.format('%sn%sm%s', 'a', 'b', 'c')
		end
	end,
}
