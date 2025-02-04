extends Node

var _player: Player

# The list of areas that the player is in range of
var active_areas = []

# The closest active area to the player, will be prioritized over all others in active_areas
var active_area: InteractionArea

# If true, the player can interact with areas
var can_interact = true

# Set the player instance the interaction manager is looking at
func set_player(player: Player):
	_player = player

func pause_interations():
	can_interact = false

func allow_interactions():
	can_interact = true

# Add a target area to list of known areas the player is in range of
func register_area(area: InteractionArea):
	active_areas.push_back(area)

# Remove the target area from the list of known areas
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

# Sorts the active areas in order of distance, with the closest one to the player listed first
func sort_areas_by_distance_to_player(area1: InteractionArea, area2: InteractionArea):
	var area1_to_player = _player.global_position.distance_to(area1.global_position)
	var area2_to_player = _player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

# Return the closest area to the player
func get_active_area():
	return active_areas[0]

func _process(_delta):
	if active_areas.size() > 0 && can_interact:
		# Sort the active areas to focus on the one closest to the player
		active_areas.sort_custom(sort_areas_by_distance_to_player)
		active_area = get_active_area()

		# TODO - any visual updates needed to prompt user to interact
	# else:
		# TODO - hide any visuals etc

# If the "interact" ation is pressed, call the interact() method of the active_area
func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed('interact') && can_interact:
		if active_areas.size() > 0:
			# Trigger the interaction logic, preventing any other interactions while
			# it is running
			pause_interations()
			await get_active_area().interact_action.call()
			allow_interactions()
