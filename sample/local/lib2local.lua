local readme = [[
	代码中，作用域之外的函数，如果高频调用，先将这个函数赋值给一个局部变量
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
}
