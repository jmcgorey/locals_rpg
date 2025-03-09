extends Area2D

@export var target_level: String = 'new_level'
@export var target_spawn_point: String = 'spawn_point'


func _on_loading_zone_entered(player: Player) -> void:
	if player is Player:
		print('Player entered loading zone...')
		LevelManager.change_level(target_level, target_spawn_point)
