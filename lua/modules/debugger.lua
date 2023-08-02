local core = require("modules.core")

local string = core.load_module("string")
local table = core.load_module("table")

local debugger = {}

debugger.log = function(message, stack, nested, from_array)
	local function parse_value(value)
		if type(value) == "string" then
			return '"' .. value .. '"'
		end

		return tostring(value)
	end

	stack = stack or 0

	nested = nested or false

	from_array = from_array or {
		0,
		0,
	}

	if not message then
		return
	end

	if type(message) ~= "table" then
		return
	end

	if stack == 0 then
		print("Debug_" .. string.randomstr(5) .. " = {")
		stack = stack + 1
	end

	if table.is_dictionary(message) then
		local count = 0

		for k, v in pairs(message) do
			local dictionary_length = table.count_keys(message)

			count = count + 1

			if type(v) == "table" then
				print(string.rep("  ", stack) .. k .. " = {")
				debugger.log(v, stack + 1, true)
			else
				local value = parse_value(v)

				if count < dictionary_length then
					value = value .. ","
				end

				print(string.rep("  ", stack) .. k .. " = " .. value)
			end

			if count == dictionary_length then
				local _end = "}"

				if from_array[1] < from_array[2] then
					_end = _end .. ","
				end

				print(string.rep("  ", stack - 1) .. _end)
			end
		end
	else
		for _, v in ipairs(message) do
			if type(v) == "table" then
				print(string.rep("  ", stack) .. "{")

				debugger.log(v, stack + 1, true, {
					_,
					#message,
				})
			else
				local value = parse_value(v)

				if _ < #message then
					value = value .. ","
				end

				print(string.rep("  ", stack) .. value)
			end

			if _ == #message then
				print(string.rep("  ", stack - 1) .. "}")
			end
		end
	end

	if not nested then
		print(" ")
	end
end

return debugger
