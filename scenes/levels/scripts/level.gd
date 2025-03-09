class_name Level extends Node

const PLAYER = preload("res://scenes/player/player.tscn")

@export var initial_spawn_point: SpawnPoint

func _ready() -> void:
	var player_pos = Vector2.ZERO
	var facing_direction: Character.FACING_DIRECTION
	if LevelManager.has_target_spawn_point():
		var target_spawn = get_spawn_point(LevelManager.target_spawn_point)
		player_pos = target_spawn.global_position
		facing_direction = target_spawn.spawn_direction
	else:
		player_pos = initial_spawn_point.global_position
		facing_direction = initial_spawn_point.spawn_direction
	
	create_player(player_pos, facing_direction)

func get_spawn_point(spawn_point_name: String) -> SpawnPoint:
	return get_node("SpawnPoints/" + spawn_point_name)

func create_player(pos: Vector2, facing_direction: Character.FACING_DIRECTION) -> void:
	var new_player = PLAYER.instantiate()
	new_player.global_position = pos
	new_player.z_index = 1
	new_player.set_direction(facing_direction)
	add_child(new_player)
