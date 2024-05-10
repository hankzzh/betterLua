local readme = [[
	循环内创建变量比循环外创建变量的效率高
	因为循环外创建的变量在循环体使用时需要跨域
]]

return {
	readme = readme,
	function()
		local publicTab = {a = true, b = 1, c = {true}, d = nil, e = 'a'}
		for i = 1, max_tab_size do
			if publicTab.a then
				local n = publicTab.b * 2 / 3 + 4 - 5 + #publicTab.c
			end
			if not publicTab.d then
				local m = publicTab.e .. publicTab.e .. publicTab.e
			end
		end
	end,
	function()
		local publicTab = {a = true, b = 1, c = {true}, d = nil, e = 'a'}
		for i = 1, max_tab_size do
			local a = publicTab.a
			local b = publicTab.b
			local c = publicTab.c
			local d = publicTab.d
			local e = publicTab.e
		
			if a then
				local n = b * 2 / 3 + 4 - 5 + #c
			end
			if not d then
				local m = e .. e .. e
			end
		end
	end,
}