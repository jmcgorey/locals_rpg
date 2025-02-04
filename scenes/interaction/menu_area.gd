extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact_action = Callable(self, 'open_menu_prompt')

func open_menu_prompt():
	print('Opening menu prompt...')
