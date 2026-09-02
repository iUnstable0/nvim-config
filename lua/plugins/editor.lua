return {
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateDown",
      "TmuxNavigateLeft",
      "TmuxNavigatePrevious",
      "TmuxNavigateRight",
      "TmuxNavigateUp",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Move to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Move to the pane below" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Move to the pane above" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Move to the right pane" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Move to the previous pane" },
    },
  },
  {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    init = function()
      vim.g.maximizer_set_default_mapping = 0
    end,
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Toggle maximized split" },
    },
  },
  {
    "lambdalisue/vim-suda",
    lazy = false,
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
}
