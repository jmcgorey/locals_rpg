extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var event_timer: Timer = $EventTimer
var can_interact: bool = true

const DELI_URL = 'https://www.grubhub.com/restaurant/gold-deli-126-e-103rd-st-new-york/3007076'

func _ready():
	interaction_area.interact_action = Callable(self, 'open_menu_prompt')

func open_menu_prompt():
	print('Opening menu prompt...')
	
	if can_interact:
		# TODO: Make behind confirmation dialogue instead, just POC for now
		can_interact = false
		OS.shell_open(DELI_URL) # Open link in user's default browser
		event_timer.start(1) # Don't allow another interaction until timer is done
		
# Reset interaction flag after timeout
func _on_timer_timeout() -> void:
	can_interact = true
	
