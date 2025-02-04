extends CharacterBody2D
class_name Player

const SPEED = 200

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
