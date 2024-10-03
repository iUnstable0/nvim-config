local opt = vim.opt
local cmd = vim.cmd

-- opt.guicursor =
-- 	"n-v-c-sm:ver25-Cursor-blinkwait175-blinkon300-blinkoff200,i-ci-ve:ver25-Cursor-blinkwait175-blinkon300-blinkoff200,r-cr-o:hor20"

opt.encoding = "utf-8"
-- opt.fileencoding = "utf-8"

opt.number = true --[[
Print the line number in front of each line.
]]

opt.relativenumber = true --[[
Show line numbers relative to the line with the cursor in front of
	each line.
]]

opt.wrap = false --[[
This option changes how text is displayed.  It doesn't change the
	text in the buffer, see |'textwidth'| for that.

	When on, lines longer than the width of the window will wrap and
	display on the next line.  When off lines will not wrap and
	only part of long lines will be displayed.  When the cursor is
	moved to a part that is not shown, the screen will scroll
	horizontally.
]]

opt.smartindent = true --[[
Do smart autoindenting when starting a new line.  Works for C-like
	programs, but can also be used for other languages.  'cindent' does
	something like this, works better in most cases, but is more strict,
	see |C-indenting|.  When 'indentexpr' is set, it overrules 'smartindent'.
	When 'paste' is set 'smartindent' is reset.  When 'autoindent' is set,
	'smartindent' is reset.  When 'smartindent' or 'cindent' is on the
	'equalprg' option is not used.  When 'lisp' is set, the indent of a line
	that starts with ')' is changed to match the line above with a '('.
]]

opt.scrolloff = 10 --[[
Minimal number of screen lines to keep above and below the cursor.
]]

opt.shell = "zsh" --[[
The program to use for the ":!" command.  The default is to use the
	$SHELL environment variable or "sh" if it is not set.  Any '!' in the
	value is expanded to the previous command |:!|.
]]

opt.inccommand = "split" --[[
Make substitution work as a live preview.  Show the current
	substitution match in the current window as you type.  The
	|:substitute| command must have the "g" flag.
]]

opt.ignorecase = true --[[
Ignore case in search patterns.  Also used by |:tag| and
	|:s|.
]]

opt.smartcase = true --[[
Override the 'ignorecase' option if the search pattern contains upper
	case characters.  Only used when the 'ignorecase' option is on.
]]

opt.cursorline = true --[[
Highlight the screen line of the cursor with CursorLine
	hl-CursorLine.  Useful to easily spot the cursor.
]]

opt.breakindent = true --[[
Every wrapped line will continue visually indented (same amount of
	space as the beginning of that line), thus preserving horizontal blocks
	of text.
]]

opt.shiftwidth = 2 --[[
Number of spaces to use for each step of (auto)indent.  Used for
	|'cindent'|, |>>|, |<<|, etc.
]]

opt.tabstop = 2 --[[
Number of spaces that a <Tab> in the file counts for.  Also see
	|:retab| command, and 'softtabstop' option.
]]

opt.path:append("**") --[[
A list of directory names which will be searched for files specified
	with a relative path.  Path names are separated by commas and/or
	whitespace.  An empty directory name is replaced with the current
	directory, which is the directory in which you started Vim.
]]

opt.wildignore:append({
	"*/node_modules/*",
	"*/.git/*",
	"*/.DS_Store",
	"*/build/*",
	"*/dist/*",
	"*/target/*",
	"*/bin/*",
	"*/obj/*",
	"*/out/*",
	"*/builds/*",
	"*/.build/*",
	"*/.cache/*",
	"*/.idea/*",
	"*/.vscode/*",
	"*/.vs/*",
}) --[[
A list of file patterns.  When a file name matches with one of these
	patterns, nothing will be added to the |wildmenu| and the file name
	will be ignored.
]]

opt.clipboard:append("unnamedplus") --[[
Use the clipboard register '+' (|quoteplus|) for all yank,
	delete, change and put operations which would normally go to the
	unnamed register.  When not included, Vim uses the clipboard register
	for all operations with a visual selection.  When the clipboard
	register is not available or Vim was not compiled with the |+clipboard|
	feature, the unnamed register is used instead.
]]

opt.iskeyword:append("-") --[[
	Count '-' as a word character.
	For example, "hello-world" will be treated as a single word.
]]

opt.termguicolors = true --[[
Use this option to enable the use of 24-bit RGB colors in the
	TUI.  When Vim was built without the |+termguicolors| feature, setting
	this option will have no effect.
]]

opt.signcolumn = "yes" --[[
	Idk
]]

opt.splitright = true --[[
When on, splitting a window will put the new window right of the
	current one.  When off, the new window will be put below the current
	one.
]]

opt.splitbelow = true --[[
When on, splitting a window will put the new window below the
	current one.  When off, the new window will be put right of the
	current one.
]]

-- Undercurl
-- cmd([[let &t_Cs = "\e[4:3m"]])
-- cmd([[let &t_Ce = "\e[4:0m"]])

cmd("colorscheme github_dark_dimmed")
