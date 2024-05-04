local readme = [[
	1. 减少函数调用可以很大提高效率
]]

return {
	readme = readme,
	function()
		for i = 1, max_tab_size do
			local x = math.sin(i)
		end
	end,
	function()
		local sin = math.sin
		for i = 1, max_tab_size do
			local x = sin(i)
		end
	end,
	function()
		local function add(a, b)
			return a + b
		end
		for i = 1, max_tab_size do
			local x = add(i, i)
		end
	end,
	function()
		for i = 1, max_tab_size do
			local function add(a, b)
				return a + b
			end
			local x = add(i, i)
		end
	end,
}
