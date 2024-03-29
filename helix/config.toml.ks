# KS HELIX SETUP
# See src helix-term/src/keymap/default.rs for default findings and the functions called.
# and helix-term/src/commands.rs for mappable commands (see static_commands!:).

# THEME
theme = "dracula"
#theme = "onelight"

# EDITOR

[editor]
mouse = true
line-number = "absolute"
cursorline = true
# idle-timeout = 300
color-modes = true
true-color = true
rulers = [80]
auto-format = false
auto-info = false
auto-pairs = false

[editor.statusline]
left = ["mode", "spinner"]
center = ["file-name"]
right = ["diagnostics", "selections", "position", "file-encoding", "file-line-ending", "file-type"]
separator = "│"

[editor.lsp] 
display-messages = true

[editor.cursor-shape]
insert = "underline"
select = "bar"

[editor.whitespace]
render = "all"


[editor.indent-guides]
render = true

# KEY BINDINGS
[keys.normal]
# Z = { Z = ":wq", Q = ":q!" } # save and quit without saving
G = "goto_file_end"
j = [ "move_line_down", "align_view_center" ]
k = [ "move_line_up", "align_view_center" ]
c = ["trim_selections", "change_selection"]

left = { left = "goto_line_start"}
right= { right= "goto_line_end"}

[keys.normal.space]
# z = ":quit"

[keys.insert]
j = { j = "normal_mode" } # Maps `jk` to exit insert mode

# Emacs Bindings in insert mode
# C-a = "goto_line_start"
# C-e = "goto_line_end"

# move cursor in insert mode
# A-h = "move_char_left"
# A-j = "move_line_down"
# A-k = "move_line_up"
# A-l = "move_char_right"
up =    "move_line_up"
down =  "move_line_down"
left =  "move_char_left"
right = "move_char_right"
# left = { left = "goto_line_start"}
# right= { right= "goto_line_end"}
