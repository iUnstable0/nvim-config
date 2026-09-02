return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeCollapse",
      "NvimTreeFindFile",
      "NvimTreeFocus",
      "NvimTreeOpen",
      "NvimTreeToggle",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
      { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in explorer" },
    },
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      renderer = {
        group_empty = true,
      },
      view = {
        width = 34,
      },
    },
  },
}
