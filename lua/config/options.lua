local opt = vim.opt

-- Appearance

-- Show the absolute line number for the current line.
-- Example: the cursor line displays 42 even when relative numbers are enabled.
-- Set to false with relativenumber = false to hide the number column entirely.
opt.number = true

-- Show the distance from the cursor instead of absolute numbers on surrounding lines.
-- Example: a line marked 5 can be reached with 5j or 5k.
-- Set to false to show absolute numbers on every line while number remains true.
opt.relativenumber = true

-- Highlight the full screen line containing the cursor, making it easier to track.
-- Set to false for a quieter display; cursorcolumn is the vertical equivalent.
opt.cursorline = true

-- Reserve a column for diagnostics, breakpoints, Git signs, and similar markers.
-- "yes" prevents text from shifting when signs appear. Other useful values are
-- "auto", "no", and "yes:2" when two signs should be visible side by side.
opt.signcolumn = "yes"

-- Allow colorschemes to use 24-bit RGB colors instead of the terminal's small palette.
-- Nearly every modern terminal supports this. Set to false only for limited terminals.
opt.termguicolors = true

-- Choose the default border used by floating windows such as hover documentation.
-- Other built-in styles include "single", "double", "solid", "shadow", and "none".
opt.winborder = "rounded"

-- Display long lines horizontally instead of continuing them on the next screen line.
-- Set to true for prose. linebreak and breakindent can make wrapped prose easier to read.
opt.wrap = false

-- Scrolling

-- Keep context visible above and below the cursor while scrolling.
-- 0 allows the cursor to touch the window edge; a very large value keeps it centered.
opt.scrolloff = 8

-- Horizontal equivalent of scrolloff, used when wrap is disabled.
-- 0 allows the cursor to touch the left or right edge before the view scrolls.
opt.sidescrolloff = 8

-- Indentation

-- Insert spaces when Tab is pressed in Insert mode.
-- Set to false for Makefiles or projects that require literal tab characters.
opt.expandtab = true

-- Display an existing tab character using this many columns.
-- This controls appearance; expandtab controls what is inserted into the file.
opt.tabstop = 2

-- Make Tab and Backspace behave like a two-space editing step in Insert mode.
-- 0 disables soft-tab behavior; -1 makes it follow shiftwidth automatically.
opt.softtabstop = 2

-- Use this many spaces for >>, <<, =, and automatic indentation.
-- Set to 4 for four-space projects, or 0 to reuse the tabstop value.
opt.shiftwidth = 2

-- Add simple C-style indentation after opening braces and similar constructs.
-- Set to false if filetype-specific indentation handles the languages you edit better.
opt.smartindent = true

-- Search and substitution

-- Ignore letter case during searches such as /config.
-- smartcase below overrides this when the search itself contains uppercase letters.
opt.ignorecase = true

-- Make /Config case-sensitive while keeping /config case-insensitive.
-- Set to false for searches that are always case-insensitive, or disable ignorecase
-- for searches that are always case-sensitive.
opt.smartcase = true

-- Preview :substitute changes in a temporary split before they are applied.
-- "nosplit" previews inside the current buffer; an empty string disables previews.
opt.inccommand = "split"

-- Completion menu

-- Control how Insert-mode completion results are presented.
-- menuone shows a menu for one result, noselect avoids accepting a result by accident,
-- and popup displays extra documentation in a floating window. Other useful values
-- include "noinsert", "preview", and "fuzzy", depending on the completion source.
opt.completeopt = { "menuone", "noselect", "popup" }

-- Limit the completion menu height so it does not cover most of the editor.
-- Set to 0 to use as much vertical space as the current window allows.
opt.pumheight = 12

-- Files and undo

-- Save undo history to disk, allowing u after closing and reopening a file.
-- Set to false globally, or use :setlocal noundofile for a sensitive temporary buffer.
opt.undofile = true

-- Ask whether to save when a command would abandon an unsaved buffer.
-- With false, commands such as :quit fail and require :quit! or an explicit save.
opt.confirm = true

-- Connect ordinary yanks, deletes, changes, and pastes to the + system clipboard.
-- Use an empty string to keep Neovim registers separate, or "unnamed" for the * selection.
opt.clipboard = "unnamedplus"

-- Windows

-- Open :split below the current window instead of above it.
-- Set to false if you prefer new horizontal splits at the top.
opt.splitbelow = true

-- Open :vsplit to the right of the current window instead of to the left.
-- Set to false if you prefer new vertical splits on the left.
opt.splitright = true

-- Preserve the text's screen position when opening, closing, or resizing splits.
-- Other strategies are "cursor", which stabilizes the cursor, and "topline",
-- which keeps the window's first visible line fixed.
opt.splitkeep = "screen"

-- Input and responsiveness

-- Enable the mouse in all modes for selecting text, resizing splits, and scrolling.
-- Use "nvi" for Normal/Visual/Insert modes only, or an empty string to disable it.
opt.mouse = "a"

-- Wait this many milliseconds for the next key in a mapping such as <leader>sv.
-- Lower values feel faster but can reject slow key sequences; Neovim defaults to 1000.
opt.timeoutlen = 400

-- Trigger CursorHold events and write the swap file after this much idle time.
-- Lower values make diagnostic and Git-sign plugins more responsive but run events more often.
opt.updatetime = 250

-- Exclude generated or vendor directories from command-line file completion.
-- Example: :edit **/<Tab> skips these paths. This does not filter NvimTree or ripgrep.
-- Add project-specific patterns here, or remove one when its files should be discoverable.
opt.wildignore:append({
  "*/.git/*",
  "*/.cache/*",
  "*/build/*",
  "*/dist/*",
  "*/node_modules/*",
  "*/target/*",
})
