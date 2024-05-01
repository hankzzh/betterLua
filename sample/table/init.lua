return{
	function()
		for i = 1, max_tab_size do
			local t = {a = nil, b = nil, c = nil, d = nil,e = nil}
			t.a = 1
			t.b = 2
			t.c = 3
			t.d = 4
			t.e = 5
		end
	end,
	function()
		for i = 1, max_tab_size do
			local t = {}
			t.a = 1
			t.b = 2
			t.c = 3
			t.d = 4
			t.e = 5
		end
	end,
}
