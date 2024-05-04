# betterLua
lua代码效率列子

运行脚本：
sh run.sh
控制台输出当前测试单元目录
./run.sh 
|\ 
| + 1 - local
| *  2 -  function.lua
| *  3 -  val.lua
|\ 
| + 4 - string
| *  5 -  format.lua
|\ 
| + 6 - table
| *  7 -  for.lua
| *  8 -  init.lua
| *  9 -  insert.lua

输入单元数字，得到测试代码和结果：
输入：5
代码:-------

function format(a, b, c)
	return a..'n'..b..'m'..c
end

return {
	function()
		for i = 1, max_tab_size do
			local a = 'a' .. 'n' .. 'b' .. 'm' .. 'c'
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = format('%sn%sm%s', 'a', 'b', 'c')
		end
	end,
	function()
		for i = 1, max_tab_size do
			local a = string.format('%sn%sm%s', 'a', 'b', 'c')
		end
	end,
}

结果:-------

sample.string.format->1 ====================	0.126271	100.0%
sample.string.format->2 ====================	0.216734	171.0%
sample.string.format->3 ====================	0.601646	476.0%


LUA_CMD变量需要指定需要测试的lua指令路径

1. 一些简单的lua代码执行时间对比代码;
2. 不同lua版本，结果会有很大不同,luajit,最新版本做了很多优化(可以将脚本中的指令设置为自己的lua指令);
3. 执行时间更少的也不是一定高效的，要理解lua运行原理，以及运行过程中没有gc的内存来综合考虑;

typedef union Value {
  GCObject *gc;       /* collectable objects */
  void *p;            /* light userdata */
  int b;              /* booleans */
  lua_CFunction f;    /* light C functions */
  lua_Integer i;      /* integer numbers */
  lua_Number n;       /* float numbers */
} Value;
typedef struct lua_TValue {
   Value value_;          //value具体的数值
   int tt_                //value的类型
} TValue;
