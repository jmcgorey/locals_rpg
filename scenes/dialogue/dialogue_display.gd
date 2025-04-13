class_name DialogueManager extends CanvasLayer

# General components
@onready var dialogue_ui: Control = $DialogueUI

# Question view components
@onready var dialogue_question_container: HBoxContainer = $DialogueUI/DialogTextView/DialogueQuestionContainer
@onready var question_label: RichTextLabel = $DialogueUI/DialogTextView/DialogueQuestionContainer/QuestionLabel

# Text view components
@onready var dialogue_text_container: HBoxContainer = $DialogueUI/DialogTextView/DialogueTextContainer
@onready var text_label: RichTextLabel = $DialogueUI/DialogTextView/DialogueTextContainer/TextLabel
@onready var next_button: Button = $DialogueUI/DialogTextView/DialogueTextContainer/NextButton

enum DIALOGUE_MODE {TEXT, QUESTION}

# TODO - maybe don't keep - function call may suffice
var current_mode: DIALOGUE_MODE = DIALOGUE_MODE.TEXT :
	set (_mode):
		current_mode = _mode
		set_dialogue_mode(_mode)


func _ready() -> void:
	# hide_dialogue_ui() # Start hidden
	pass


func hide_dialogue_ui() -> void:
	print('Hiding dialogue ui')
	dialogue_ui.visible = false

func show_dialogue_ui() -> void:
	print('Showing dialogue ui')
	dialogue_ui.visible = true
	

# Updates the display to reflect the dialog mode being currently used
func set_dialogue_mode(_mode: DIALOGUE_MODE) -> void:
	if _mode == DIALOGUE_MODE.QUESTION:
		dialogue_text_container.visible = false
		dialogue_question_container.visible = true
	else: # Default to TEXT mode
		dialogue_question_container.visible = false
		dialogue_text_container.visible = true
	pass

# func set_text_details(text, name):
	# TODO function to update label text & next button
	# Button should update to "End" or something when on last option
