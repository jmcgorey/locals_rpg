class_name Player extends Character

const SPEED = 75

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	
	if abs(velocity.x) > 0 || abs(velocity.y) > 0:
		set_walking_animation(input_direction)
	else:
		set_idle_animation()

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
