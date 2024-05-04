local readme = [[
	默认创建出来的的表，都是空的，在插入元素的过程，逐渐翻倍扩大，从0到1， 1到2，2到4，...都会触发realloc，同时把旧元素拷贝到新申请的空间中，对于最终有成千上万个元素的table，扩张的开销可以接受，但是对于大量生成小的table的场景，会明显拖慢性能，可以通过lua的构造函数，让Lua的编译器预分配空间
]]

return{
	readme = readme,
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
