--[[
	test复杂度越高，效率约接近
	总体感觉数值更好
]]
local array = make_array()

local function test(i)
	i = i or 50
	if i > 1 then
		test(i - 1)
	end
	local a, b = 33, 88
	return a + b
end

return {
	function()
		for k, v in ipairs(array) do
			test()
		end
	end,
	function()
		for k, v in pairs(array) do
			test()
		end
	end,
	function()
		for i = 1, #array do
			test()
		end
	end,
	function()
		for i = #array, 1, -1 do
			test()
		end
	end,
}