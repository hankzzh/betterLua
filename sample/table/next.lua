local readme = [[
	错误next用法
]]
local max_size = math.modf(max_tab_size)
local array1 = make_array(max_size)
local array2 = make_array(max_size/100)
return {
	function()
		for k in pairs(array1) do
			array1[k] = nil
		end
	end,
	next = function()
		local k = next(array2)
		while k do
			array2[k] = nil
			k = next(array2)
		end
	end,
}