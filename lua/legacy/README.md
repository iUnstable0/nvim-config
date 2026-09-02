# Archived configuration

This directory preserves the original custom Lua modules and plugin autodiscovery implementation.
Nothing here is loaded by the active configuration.

The files use `.old.lua` so they remain readable as Lua while being visibly archival. They are kept
as source history, not as supported modules that can still be loaded with `require()`.

## Original plugin autodiscovery contract

The old loader lived at `lua/plugins/init.lua`; its archived copy is
`plugins/autodiscovery.old.lua`. It scanned the original plugin directory with:

```lua
vim.fs.dir(vim.fn.stdpath("config") .. "/lua/plugins", { depth = 2 })
```

A plugin was represented by this path convention:

```text
lua/plugins/<GitHub owner>/<repository>.lua
```

For example, an empty file at:

```text
lua/plugins/tpope/vim-surround.lua
```

implicitly produced this Lazy specification:

```lua
"tpope/vim-surround"
```

A file could return metadata when the repository name or Lazy options needed customization:

```lua
return {
  real_name = "nvim-tree.lua",
  options = {
    config = function()
      require("nvim-tree").setup()
    end,
  },
}
```

`real_name` replaced the filename-derived repository name. `options` was merged into the generated
Lazy specification using the custom table module.

## Why it was retired

- The directory layout encoded behavior that was invisible to readers unfamiliar with the loader.
- `pcall(require, ...)` silently ignored invalid plugin files and configuration errors.
- The custom string and table proxies were required just to construct repository names.
- Dependencies, loading events, commands, keymaps, and descriptions were harder to see together.
- The scanner only understood files exactly two levels below `lua/plugins/`.

The active configuration now imports three ordinary modules explicitly:

```lua
{ import = "plugins.ui" }
{ import = "plugins.navigation" }
{ import = "plugins.editor" }
```

This keeps the same multi-file organization without a second plugin-spec language.

## Other archived files

- `modules/*.old.lua`: fluent string/table proxy experiment and debugger
- `../config/mappings.old.lua`: the original mapping-template DSL
- `plugins/**/*.old.lua`: plugin fragments consumed by the autodiscovery loader
