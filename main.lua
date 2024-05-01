
local headers = {...}
local samples = {}

for k, head in pairs(headers) do
	samples[head] = require(head)
end

function run_all(ss, path)
	path = path or ""
	for name, sample in pairs(ss) do
		if type(sample) == "function" then
			timer(path..name, sample)
		else
			run_all(sample, path..name.."->")
		end
	end
end

run_all(samples)

