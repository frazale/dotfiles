local ipc = "noctalia msg"

return {
	terminal = "foot",
	fileManager = "dolphin",
	browser = "brave",
	menu = ipc .. " panel-toggle launcher",
	control_center = ipc .. " panel-toggle control-center",
	settings = ipc .. " settings-toggle",
}
