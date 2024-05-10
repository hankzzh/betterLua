local readme = [[
	差别不大
]]
local array = make_array()

local function test(i)
	i = i or 50
	if i > 1 then
		test(i - 1)
	end
	local a, b = i, i + 10
	return a + b
end

return {
	readme = readme,
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