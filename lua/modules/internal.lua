local table = require("modules.table")
local string = require("modules.string")

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
		-- for a, s in ipairs({ ... }) do
		-- 	print("Call level experiemnet", a, s)
		-- end

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
						elseif key == "merge" then
							return function(...)
								return internal.populate_method(table.merge)(...)
							end
						elseif key == "count_keys" then
							return function(...)
								return internal.populate_method(table.count_keys)(...)
							end
						elseif key == "is_dictionary" then
							return function(...)
								return internal.populate_method(table.is_dictionary)(...)
							end
						else
							return rawget(array, key)
						end
					end,
				})
			elseif type(param) == "string" then
				local string_proxy = { value = param }

				setmetatable(string_proxy, {
					__tostring = function()
						return param
					end,
					__concat = function(_, other)
						return param .. other
					end,
					__index = function(_, key)
						if key == "split" then
							return function(...)
								-- for a, s in ipairs({ ... }) do
								-- 	print("ROot leve", a, type(s.value), s)
								-- end

								-- Modify the paramemeters to be passed to the fuinction
								local parameters = { ... }

								for _, parameter in ipairs(parameters) do
									if type(parameter) == "table" then
										parameters[_] = parameter.value
									end
								end

								return internal.populate_method(string.split)(unpack(parameters))
							end
						else
							return param
						end
					end,
				})

				result[_] = string_proxy
			end
		end

		return unpack(result)
	end
end

return internal
