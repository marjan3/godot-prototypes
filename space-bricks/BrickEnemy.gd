extends Sprite
onready var animation_player = get_node("AnimationPlayer")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var idle_animation = animation_player.get_animation("idle")
	idle_animation.set_loop(true)
	animation_player.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
