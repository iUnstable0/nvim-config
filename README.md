# nvim-config

My neovim configuration. (Not finished)

## Installation

Make sure you delete or move your old neovim configuration to somewhere safe before installing this one.

### Linux & MacOS

```bash
git clone https://github.com/iUnstable0/nvim-config.git ~/.config/nvim
```

### Windows

```bash
git clone https://github.com/iUnstable0/nvim-config.git $env:LOCALAPPDATA\nvim
```

## Extra

If you only want to use my custom module, copy the `lua/modules` folder to your neovim configuration folder.

### Usage

```lua
local core = require("modules.core")

-- Debugger module
local debugger = core.load_module("debugger")

-- String module
local string = core.load_module("string")
-- Table module
local table = core.load_module("table")
-- Utils module (Empty as of now)
local utils = core.load_module("utils")
```

### Debugger Module

```lua
local a = {
    "Hello",
    "World"
}

debugger.log(a) -- Beautifully prints the array/dictionary
```

### String Module

```lua
local splitted = string.split("Hello World", " ") -- Returns a table { "Hello", "World" }

local joined = splitted:concat(".") -- Returns a string "Hello.World"
local popped = splitted:pop() -- Returns popped table { "Hello" }

local random = string.randomstr(10) -- Returns a random string with length of 10
```

### Table Module

```lua
local a = {
    "Hello",
    "World",
    "Hi"
}

local popped = table.pop(a) -- Returns popped table { "Hello", "World" }
local joined = popped:concat(" ") -- Returns a string "Hello World"

-- More examples

local poop = table.concat(a, " ") -- Returns a string "Hello World Hi"
local splitted = poop:split(" ") -- Returns a table { "Hello", "World", "Hi" }
local roblox = splitted:pop() -- Returns popped table { "Hello", "World" }
local robux = roblox:concat(" ") -- Returns a string "Hello World"

-- Equivalent to

local minecraft = table.concat(a, " "):split(" "):pop():concat(" ") -- Returns a string "Hello World"
```

```lua
local a = {
    hello = "Hello",
    hi = "World"
}

local is_dictionary = table.is_dictionary(a) -- Returns true
local count = table.count_keys(a) -- Returns 2

local b = {
  name = "John",
  age = 20
}

debugger.log(
  table.merge(a, b)
) -- Returns { hello = "Hello", hi = "World", name = "John", age = 20 }

-- Idk why you would do this but you can merge a dictionary with a table
-- I also dk why this is a thing but it is
-- No idea why it works too

local c = {
  "Lol",
  "Lmao"
}

local poop = table.pop(c) -- Returns popped table { "Lol" }

debugger.log(
  poop:merge(b) -- Never really tested this but it SHOULD work
) -- Returns { 1 = "Lol", name = "John", age = 20 }
```
