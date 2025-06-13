extends InteractionArea

@export var dialogue_source: DialogueSource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interact_action = Callable(self, 'play_dialogue')


func play_dialogue() -> void:
	if dialogue_source == null:
		print('No dialogue source configured')
		return
	
	var dialogue_item = dialogue_source.get_next_dialogue_item()
	dialogue_item.reset()
	var speaker_name = dialogue_source.speaker_name
	
	DialogueDisplay.play_dialogue_item(speaker_name, dialogue_item)
