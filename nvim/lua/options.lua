local o = vim.o
o.shiftwidth = 2
o.softtabstop = -1
o.expandtab = true

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		scope = "cursor",
		severity_sort = true,
		close_events = {
			"BufLeave",
			"CursorMoved",
		},
		focusable = false,
		max_height = 500,
	},
})

o.clipboard = "unnamedplus"
o.number = true
o.ignorecase = true
o.confirm = true
o.smartcase = true
o.smartindent = true
o.autoread = true
o.wrap = true
