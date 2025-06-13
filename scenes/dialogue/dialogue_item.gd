class_name DialogueItem extends Resource

## The lines of dialogue to display
@export var lines: Array[String] = []

var current_line_index = 0

## Returns `true` if there are no dialogue lines configured
func is_empty() -> bool:
	if lines == null:
		return true
	
	return lines.is_empty()


## Returns true if the last line is being shown
func is_last_line() -> bool:
	return current_line_index == lines.size()


## Resets the dialog to the beginning of the lines list
func reset() -> void:
	current_line_index = 0


## Returns the next line in the dialogue
func get_next_line() -> String:
	if lines == null:
		return ''
	if current_line_index >= lines.size():
		return ''
	
	var next_line = lines[current_line_index]
	current_line_index += 1
	return next_line
