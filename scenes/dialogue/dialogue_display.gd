class_name DialogueManager extends CanvasLayer

# General components
@onready var dialogue_ui: Control = $DialogueUI

# Text view components
@onready var dialogue_text: RichTextLabel = %DialogueText
@onready var next_button: Button = %NextButton
@onready var name_label: RichTextLabel = %NameLabel

var dialogue_item: DialogueItem

signal dialogue_started
signal dialogue_ended

func _ready() -> void:
	visible = false
	next_button.pressed.connect(_on_next_line_pressed)


func play_dialogue_item(speaker_name: String, _dialogue_item: DialogueItem) -> void:
	if _dialogue_item == null:
		print('No dialogue item to display!')
	dialogue_item = _dialogue_item
	_set_speaker_name(speaker_name)
	_start_dialogue()
	_display_next_line()


func _set_speaker_name(speaker_name: String) -> void:
	name_label.text = speaker_name


func _start_dialogue() -> void:
	visible = true
	get_tree().paused = true # Pause the game while dialogue up
	dialogue_started.emit()


func _finish_dialogue() -> void:
	visible = false
	get_tree().paused = false # Unpause game
	dialogue_ended.emit()
	dialogue_item = null # clear dialogue item


func _display_next_line() -> void:
	if dialogue_item == null:
		_finish_dialogue()
	
	var next_line = dialogue_item.get_next_line()
	var is_last_line = dialogue_item.is_last_line()
	
	dialogue_text.text = next_line
	
	if next_line == '': # If out of dialogue, finish up
		_finish_dialogue()
	
	if is_last_line:
		%NextButton.text = 'Done'
	else:
		%NextButton.text = 'Next'

## Advance to the next line in the dialogue when the button is pressed
func _on_next_line_pressed():
	_display_next_line()
