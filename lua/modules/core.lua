local internal = require("modules.internal")

local core = {}

core.load_module = function(module_name)
	local return_value = require("modules." .. module_name)

	if type(return_value) == "table" then
		return setmetatable({}, {
			__index = function(_, key)
				-- local value = rawget(return_value, key)
				local value = return_value[key]

				if type(value) == "function" then
					value = internal.populate_method(value)
				end

				return value
			end,
		})

		-- setmetatable(return_value, {
		-- 	__index = function(_, key)
		-- 		local value = rawget(return_value, key)

		-- 		if type(value) == "function" then
		-- 			value = internal.populate_method(value)
		-- 		end

		-- 		return value
		-- 	end,
		-- })

		-- return return_value
	elseif type(return_value) == "function" then
		return internal.populate_method(return_value)
	end
end

return core
