local readme = [[
	table.remove尽量减少中间删除元素
]]
local max_size = math.modf(max_tab_size)
local array1 = make_array(max_size)
local array2 = make_array(max_size)
local array3 = make_array(max_size/100)
return {
	function()
		for i = 1, #array1 do
			table.remove(array1)
		end
	end,
	function()
		for i = #array2, 1, -1 do
			array2[i] = nil
		end
	end,
	remove_from_head = function()
		for i = 1, #array3 do
			table.remove(array3, 1)
		end
	end,
}