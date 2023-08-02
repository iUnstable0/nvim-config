local _string = {}

_string.split = function(str, separator)
	separator = separator:gsub("([%.%+%-%%%?%[%]%^%$%*%(%)])", "%%%1")

	local pattern = "(.-)" .. separator
	local array = {}
	local last_part

	for value in string.gmatch(str, pattern) do
		table.insert(array, value)
	end

	last_part = string.match(str, separator .. "(.*)$")

	if last_part and last_part ~= "" then
		table.insert(array, last_part)
	end

	return array
end

_string.randomstr = function(length)
	local str = ""

	for _ = 1, length do
		str = str .. string.char(math.random(97, 122))
	end

	return str
end

setmetatable(_string, {
	__index = function(_, key)
		-- if rawget(_string, key) then
		-- 	return rawget(_string, key)
		-- else
		return string[key]
		-- end
	end,
})

return _string
