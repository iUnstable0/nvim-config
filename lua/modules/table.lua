local _table = {}

_table.is_list = function(table_)
	if type(table_) ~= "table" then
		return false
	end

	-- local count = 0

	-- for _, _ in pairs(table_) do
	-- 	count = count + 1
	-- end

	-- for i = 1, count do
	-- 	if table_[i] == nil then
	-- 		return false
	-- 	end
	-- end

	for key, _ in pairs(table_) do
		if type(key) ~= "number" then
			return false
		end
	end

	return true
end

_table.is_dictionary = function(table_)
	return type(table_) == "table" and not _table.is_list(table_)
end

_table.count_keys = function(table_)
	local count = 0

	for _, _ in pairs(table_) do
		count = count + 1
	end

	return count
end

_table.pop = function(table_)
	local new_table = {}

	for i = 1, #table_ - 1 do
		table.insert(new_table, table_[i])
	end

	return new_table
end

_table.concat = function(table_, separator)
	local str = ""

	for i, value in ipairs(table_) do
		if i == 1 then
			str = str .. value
		else
			str = str .. separator .. value
		end
	end

	return str
end

_table.merge = function(target, object)
	if _table.is_dictionary(object) then
		for key, value in pairs(object) do
			target[key] = value
		end
	else
		for _, value in ipairs(object) do
			table.insert(target, value)
		end
	end

	return target
end

setmetatable(_table, {
	__index = function(_, key)
		-- print(key)
		-- if rawget(_table, key) then
		-- 	print(key .. " is a table function")
		-- 	return rawget(_table, key)
		-- else
		-- 	print(key .. " is not a table function")
		return table[key]
		-- end
	end,
})

return _table
