
local val = "test"
local max_size = 100
return {
	function()
		local tab = {}
		for i = 1, max_size do
			table.insert(tab, val)
		end
	end,
	function()
		local tab = {}
		for i = 1, max_size do
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