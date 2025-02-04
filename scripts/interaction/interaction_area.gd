extends Area2D
class_name InteractionArea

# If true, the area is able to receive interactions
var _is_active = true

var interact_action: Callable = func():
	# To be replaced by calling scene
	pass

# Allow the user to interact with the area
func activate():
	_is_active = true

# Prevent the user from interacting with the area
func deactivate():
	_is_active = false
	
# Add the area to the list of areas the player can interact with
func register():
	InteractionManager.register_area(self)

# Take the area out of the list of areas the player can interact with
func deregister():
	InteractionManager.unregister_area(self)
	
# Automatically register the area when the player enters it
func _on_body_entered(_body: Node2D) -> void:
	if _body is Player and _is_active:
		register()
		
# Automatically deregister the area when the player leaves it
func _on_body_exited(_body: Node2D) -> void:
	if _body is Player:
		deregister()
