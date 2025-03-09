extends Node

var target_spawn_point: String

func change_level(level_name: String, spawn_point_name: String) -> void:
	
	# Save the spawn point name so the level can reference it onReady
	target_spawn_point = spawn_point_name
	
	# Load in the new level
	_load_level(level_name)
	
func _load_level(level_name: String) -> void:
	print('Loading level: ' + level_name)
	
	get_tree().paused = true
	
	var full_level_name = 'scenes/levels/' + level_name + '.tscn'
	get_tree().call_deferred('change_scene_to_file', full_level_name)
	
	await get_tree().process_frame # wait for next frame to finish
	
	get_tree().paused = false

func has_target_spawn_point() -> bool:
	return target_spawn_point && target_spawn_point != ''
