extends CharacterBody2D
class_name Player

const SPEED = 100

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite

enum FACING_DIRECTION {NONE, FRONT, BACK, LEFT, RIGHT}

var last_facing_direction: FACING_DIRECTION = FACING_DIRECTION.FRONT

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED	
	
	if abs(velocity.x) > 0 || abs(velocity.y) > 0:
		set_walking_animation(input_direction)
	else:
		set_idle_animation()
	
	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func set_walking_animation(direction):
	var facing = get_facing_direction(direction)
	last_facing_direction = facing
	print('Walking Facing: ', get_facing_direction_text(facing))
	
	match facing:
		FACING_DIRECTION.FRONT:
			anim_sprite.play('walk_front')
			return
		FACING_DIRECTION.BACK:
			anim_sprite.play('walk_back')
			return
		FACING_DIRECTION.LEFT:
			anim_sprite.play('walk_left')
			return
		FACING_DIRECTION.RIGHT:
			anim_sprite.play('walk_right')
			return
		
func set_idle_animation():
	var facing = last_facing_direction
	print('Idle Facing: ', get_facing_direction_text(facing))
	match facing:
		FACING_DIRECTION.FRONT:
			anim_sprite.play('idle_front')
			return
		FACING_DIRECTION.BACK:
			anim_sprite.play('idle_back')
			return
		FACING_DIRECTION.LEFT:
			anim_sprite.play('idle_left')
			return
		FACING_DIRECTION.RIGHT:
			anim_sprite.play('idle_right')
			return

func get_facing_direction(direction: Vector2) -> FACING_DIRECTION:
	if direction.x > 0:
		return FACING_DIRECTION.RIGHT
	if direction.x < 0:
		return FACING_DIRECTION.LEFT
	if direction.y < 0:
		return FACING_DIRECTION.BACK
	if direction.y > 0:
		return FACING_DIRECTION.FRONT
		
	return FACING_DIRECTION.NONE
	
func get_facing_direction_text(dir: FACING_DIRECTION) -> String:
	match dir:
		FACING_DIRECTION.FRONT:
			return 'front'
		FACING_DIRECTION.BACK:
			return 'back'
		FACING_DIRECTION.LEFT:
			return 'left'
		FACING_DIRECTION.RIGHT:
			return 'right'
	return 'none'
