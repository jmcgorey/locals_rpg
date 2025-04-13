extends Node

@export var SequencedDialogueItemsContainer: Node
@export var RandomDialogueItemsContainer: Node

@export var showSequencedDialog: bool = true # TODO - set this automatically or depend on caller?
@export var characterName: String = 'CharacterName'

var _currentDialogueItems: Array[DialogueItem] = []

## Gets all dialogue items from the associated container node
##
## 
func _get_dialogue_items(container_node: Node) -> Array[DialogueItem]:
	# If container doesn't exist, no items exist
	if container_node == null:
		return []
		
	# Find all DialogueItem children of the container
	var dilogue_items: Array[DialogueItem] = []
	for _item in container_node.get_children():
		if _item is DialogueItem:
			dilogue_items.append(_item) 
	return dilogue_items
	
func play_dialogue() -> void:
	if showSequencedDialog:
		_currentDialogueItems = _get_dialogue_items(SequencedDialogueItemsContainer)
