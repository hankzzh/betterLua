max_tab_size = 2000000

function make_array(size)
	size = math.modf(size or max_tab_size)
	local array = {}
	for i = 1, size do
		array[#array + 1] = true
	end
	return array
end

local n = 1
local first

function timer(name, f)
	local time1 = os.clock()
	f()
	local time2 = os.clock()
	local use = os.clock() - time1
	first = first or use
	print(name.." ====================", use, math.modf(use * 100 / first).."%")
	n = n + 1
end

