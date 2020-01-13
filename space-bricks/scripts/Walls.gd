extends Node

signal ball_exited
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_OutOfBoundsWall_body_entered(body) -> void:
	if body.is_in_group("balls"):
		print("ball exited")
		self.emit_signal("ball_exited")
	pass
