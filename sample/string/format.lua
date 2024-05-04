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
	function()
		for i = 1, max_tab_size do
			local a = string.format('%06x', 123456)
		end
	end,
	function()
		local _convertTable = {
			[0] = "0",
			[1] = "1",
			[2] = "2",
			[3] = "3",
			[4] = "4",
			[5] = "5",
			[6] = "6",
			[7] = "7",
			[8] = "8",
			[9] = "9",
			[10] = "A",
			[11] = "B",
			[12] = "C",
			[13] = "D",
			[14] = "E",
			[15] = "F",
			[16] = "G",
		}
		function ConvertDec2X(dec)
			local text = ""
			while dec > 0 do
				local x = dec & 0xf
				text = _convertTable[x]..text
				dec = dec >> 4
			end
			return text
		end
		for i = 1, max_tab_size do
			local a = ConvertDec2X(123456)
		end
	end,
}
