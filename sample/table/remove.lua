max_size = max_tab_size // 100
local array1 = make_array(max_size)
local array2 = make_array(max_size)
local array3 = make_array(max_size)
local array4 = make_array(max_size)
local array5 = make_array(max_size)
local array6 = make_array(max_size)
local array7 = make_array(max_size)
return {
	function()
		for i = 1, #array1 do
			table.remove(array1)
		end
	end,
	function()
		for i = #array7, 1, -1 do
			table.remove(array7, i)
		end
	end,
	function()
		for i = 1, #array6 do
			table.remove(array6, 1)
		end
	end,
	function()
		for i = 1, #array2 do
			array2[i] = nil
		end
	end,
	function()
		for i = #array3, 1, -1 do
			array3[i] = nil
		end
	end,
	function()
		for k in pairs(array4) do
			array4[k] = nil
		end
	end,
	function()
		local k = next(array5)
		while k do
			array5[k] = nil
			k = next(array5)
		end
	end,
}