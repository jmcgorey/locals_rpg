extends Area2D
class_name InteractionArea

var interact_text_scene = preload("res://scenes/interaction/interact_text.tscn")
var interact_text_instance: Node2D

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
	
func show_interact_text() -> void:
	interact_text_instance = interact_text_scene.instantiate()
	add_child(interact_text_instance)
	interact_text_instance.global_position = self.global_position
	interact_text_instance.global_position.y -= 15


func hide_interact_text() -> void:
	if interact_text_instance != null:
		interact_text_instance.queue_free()
	
# Automatically register the area when the player enters it
func _on_body_entered(_body: Node2D) -> void:
	if _body is Player and _is_active:
		register()
		show_interact_text()
		
# Automatically deregister the area when the player leaves it
func _on_body_exited(_body: Node2D) -> void:
	if _body is Player:
		deregister()
		hide_interact_text()
