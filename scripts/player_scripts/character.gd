class_name Character extends CharacterBody2D

# The direction the character is currently facing
@export var facing_direction: FACING_DIRECTION = FACING_DIRECTION.FRONT

# The sprite used to animate the character
@export var anim_sprite: AnimatedSprite2D

# On startup, start the character idling in the passed in direction
func _ready() -> void:
	set_idle_animation()


# Turns the character to face the specified direction
func set_direction(direction: FACING_DIRECTION) -> void:
	facing_direction = direction

# Set the walking animation of the player based on the direction they are
# moving in
func set_walking_animation(direction: Vector2):
	var facing = get_facing_direction(direction)
	# Store the latest walking direction so we can set the proper idle animation
	facing_direction = facing
	
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
		

# Set the idle animation of the player based on the most recent walking direction
func set_idle_animation():
	var facing = facing_direction
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


enum FACING_DIRECTION {NONE, FRONT, BACK, LEFT, RIGHT}

# Determine which direction the character is facing based on its movement vector
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

# Get the text of the facing direction for pretty printing purposes
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
