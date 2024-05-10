local readme = [[
	非必要不要在运行过程中创建函数
]]

return {
	readme = readme,
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
