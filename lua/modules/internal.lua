local table = require("modules.table")

local internal = {}

internal.populate_method = function(func)
	return function(...)
		-- local line = debug.getinfo(2, "l").currentline

		-- debug.sethook(function(event, line, ...)
		-- 	local results = { ... }

		-- 	for i, result in ipairs(results) do
		-- 		local resultType = type(result)
		-- 		if resultType == "table" then
		-- 			print("A")
		-- 		else
		-- 			print("B")
		-- 		end
		-- 	end

		-- 	return ...
		-- end, "r")

		local result = { func(...) }

		for _, param in ipairs(result) do
			if type(param) == "table" then
				setmetatable(param, {
					__index = function(array, key)
						if key == "concat" then
							return function(...)
								return internal.populate_method(table.concat)(...)
							end
						elseif key == "pop" then
							return function(...)
								return internal.populate_method(table.pop)(...)
							end
						else
							return rawget(array, key)
						end
					end,
				})
			end
		end

		return unpack(result)
	end
end

return internal
