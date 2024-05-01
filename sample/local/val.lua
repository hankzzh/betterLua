--[[
	循环内创建变量比循环外创建变量的效率高（猜想可能因为循环外创建的变量在循环体使用时需要跨域，代价比创建变量大）
]]
max_tab_size = max_tab_size * 1

local function raw_test(i, ...)
	a, b, c, d, e = ...
	i = i or 2
	if i > 1 then
		raw_test(i - 1, ...)
	end
	local a, b = 33, 88
	return a + b
end

local function test(...)
	return raw_test(2, ...)
end

return {
	function()
		local a, b, c, d, e
		for i = 1, max_tab_size do
			a = 1
			b = true
			c = {1}
			d = "abc"
			e = nil
			test(a, b, c, d, e)
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = 1
			local b = true
			local c = {1}
			local d = "abc"
			local e = nil
			test(a, b, c, d, e)
		end
	end,
	function()
		for i = 1, max_tab_size do
			local t = {1, true, {1}, "abc", nil}
			local a = t[1]
			local b = t[2]
			local c = t[3]
			local d = t[4]
			local e = t[5]
			test(a, b, c, d, e)
		end
	end,
	function()
		local t = {1, true, {1}, "abc", nil}
		for i = 1, max_tab_size do
			--时间最短？需要合理的解释 jit优化？
			local a = t[1]
			local b = t[2]
			local c = t[3]
			local d = t[4]
			local e = t[5]
			test(a, b, c, d, e)
		end
	end,
	function()
		local t = {1, true, {1}, "abc", nil}
		for i = 1, max_tab_size do
			--时间最短？需要合理的解释 jit优化？
			local a = t[1]
			local b = t[2]
			local c = t[3]
			local d = t[4]
			local e = t[5]
			test(t[1], t[2], t[3], t[4], t[5])
		end
	end,
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