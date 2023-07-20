local _string = {}

_string.split = function(str, separator)
	local array = {}

	for value in string.gmatch(str, "([^" .. separator .. "]+)") do
		table.insert(array, value)
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
