class_name DialogueSource extends Resource

## The name of the actor who is speaking the dialogue
@export var speaker_name: String = 'Speaker Name'

## The dialogue to show first, before choosing random dialogue
@export var sequential_dialogue: DialogueItem

## The pool of random dialogue to choose from after the sequential
## dialogue is finished
@export var random_dialogue_list: Array[DialogueItem] = []

## Used as a "nonce" flag to only show sequential dialogue once.
## Sequential dialogue is repeated if no random dialogue is configured.
var should_use_sequential_dialogue: bool = true


## Returns true if there are sequential dialogue lines to display
func _has_sequential_dialogue() -> bool:
	return sequential_dialogue != null && !sequential_dialogue.is_empty()


## Returns true if there are random dialogue lines to display
func _has_random_dialogue() -> bool:
	return random_dialogue_list != null && !random_dialogue_list.is_empty()


## Get a random line from the random list
func _get_random_dialogue_item() -> DialogueItem:
	return random_dialogue_list.pick_random()


## Gets the next dialogue item to be displayed from this source.
## Can return `null` if no DialogueItems configured on source.
func get_next_dialogue_item() -> DialogueItem:
	# Guard against empty sequential dialogue
	if should_use_sequential_dialogue && !_has_sequential_dialogue():
		should_use_sequential_dialogue = false
	
	var result: DialogueItem
	if should_use_sequential_dialogue:
		# Return the sequential dialogue once
		should_use_sequential_dialogue = false
		result = sequential_dialogue
		
		# If no random dialogue, keep sequential enabled
		if !_has_random_dialogue():
			should_use_sequential_dialogue = true
	
	if result == null && _has_random_dialogue():
		result = _get_random_dialogue_item()
	
	return result
