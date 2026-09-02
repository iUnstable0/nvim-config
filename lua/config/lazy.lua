local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local clone = vim.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }, { text = true }):wait()

  if clone.code ~= 0 then
    error("Could not install lazy.nvim:\n" .. (clone.stderr or "unknown error"))
  end
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.navigation" },
  { import = "plugins.editor" },
}, {
  defaults = { lazy = true },
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  ui = { border = "rounded" },
})
