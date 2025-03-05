class_name Player extends Character

const SPEED = 75

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite

func _ready() -> void:
	set_direction(Character.FACING_DIRECTION.BACK)

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	
	if abs(velocity.x) > 0 || abs(velocity.y) > 0:
		set_walking_animation(input_direction, anim_sprite)
	else:
		set_idle_animation(anim_sprite)

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
