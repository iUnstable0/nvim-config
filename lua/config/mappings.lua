vim.g.mapleader = " "

local keymaps = {
	i = {},
	n = {
		x = '"_x',

		advanced = {
			{
				template = {
					"<leader>",
					{ ":", "<CR>" },
				},
				keys = {
					nh = "nohl", -- Remove highlight from search results
					sx = "close", -- Close current split window
				},
			},
			{
				template = {
					"<leader>",
					{ "<C-", "", ">", "" },
				},
				keys = {
					["+"] = "a", -- Increase number under cursor
					["-"] = "x", -- Decrease number under cursor

					advanced = {
						{
							"w",
							{
								sv = "v", -- Split window vertically
								sh = "s", -- Split window horizontally
								se = "=", -- Make split windows equal width
							},
						},
					},
				},
			},
		},
	},
}

local keymap = vim.keymap

local function debug(table, stack)
	stack = stack or 0

	for k, v in pairs(table) do
		if type(v) == "table" then
			print(string.rep("  ", stack) .. k .. ":")
			debug(v, stack + 1)
		else
			print(string.rep("  ", stack) .. k .. ": " .. v)
		end
	end
end

for mode, maps in pairs(keymaps) do
	for maps_key, maps_value in pairs(maps) do
		if type(maps_value) == "table" then
			-- Advanced mode

			for _, advanced in ipairs(maps_value) do
				local template = advanced.template
				local keys = advanced.keys

				for keys_key, keys_value in pairs(keys) do
					local command_template = template[2]

					local mapped_keys = {}

					if type(keys_value) == "table" then
						-- Advanced key mode

						local new_advanced_map = {}

						-- local starting_command = ""

						-- if command_template[1] ~= "" then
						-- 	starting_command = command_template[1]
						-- end

						for _, advanced_keys in ipairs(keys_value) do
							local raw = {}

							for _, advanced_key in ipairs(advanced_keys) do
								if type(advanced_key) ~= "table" then
									raw[_] = advanced_key
								end
							end

							for _, advanced_key in ipairs(advanced_keys) do
								if type(advanced_key) == "table" then
									for advanced_key_key, advanced_key_value in pairs(advanced_key) do
										local new_map = {
											map = template[1] .. advanced_key_key,
											command = "",
											next_position = 1,
											counter = 0, -- First occurence of "" in command_template - Directly proportional to the number of raw keys

											-- command = starting_command
										}

										if new_advanced_map[advanced_key_key] then
											new_map = new_advanced_map[advanced_key_key]

											-- debug(new_map)
										end

										-- for __, command in ipairs(command_template) do
										for __ = new_map.next_position, #command_template do
											local command = command_template[__]

											if command == "" then
												-- print("Counter: " .. tostring(counter) .. " | _: " .. tostring(_))
												if new_map.counter + 1 > _ then
													break
												end

												new_map.counter = new_map.counter + 1

												if raw[new_map.counter] then
													new_map.command = new_map.command .. raw[new_map.counter]
												else
													new_map.command = new_map.command .. advanced_key_value
												end
											else
												new_map.command = new_map.command .. command
											end

											new_map.next_position = new_map.next_position + 1
										end

										-- table.insert(new_advanced_map, new_map)
										new_advanced_map[advanced_key_key] = new_map

										-- new_advanced_map[advanced_key_key] =
									end
								end
							end
						end

						-- debug(new_advanced_map)

						for _, advanced_map in pairs(new_advanced_map) do
							table.insert(mapped_keys, {
								map = advanced_map.map,
								command = advanced_map.command,
							})
						end
					else
						-- Simple key mode

						local new_map = {
							map = template[1] .. keys_key,
							command = "",
						}

						new_map.command = command_template[1] .. keys_value

						local _end = 2

						if command_template[_end] == "" then
							_end = 3
						end

						new_map.command = new_map.command .. command_template[_end]

						table.insert(mapped_keys, new_map)
					end

					for _, mapped_key in ipairs(mapped_keys) do
						keymap.set(mode, mapped_key.map, mapped_key.command)
					end
				end
			end
		else
			-- Simple mode

			keymap.set(mode, maps_key, maps_value)
		end
	end
end
