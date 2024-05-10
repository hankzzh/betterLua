
local readme = [[
	table.insert尽量减少中间插入
	3和4 比1快原因不明
]]

local val = "test"
local max_size = 100
return {
	readme = readme,
	function()
		local tab = {}
		for i = 1, max_size do
			table.insert(tab, val)
		end
	end,
	function()
		local tab = {}
		for i = 1, max_size // 100 do
			table.insert(tab, 1, val)
		end
	end,
	function()
		local tab = {}
		for i = 1, max_size do
			tab[i] = val
		end
	end,
	function()
		local tab = {}
		for i = 1, max_size do
			tab[#tab] = val
		end
	end,
}