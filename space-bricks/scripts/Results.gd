extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var rect = self.get_rect() 
	
	rect.set_position(Vector2(
        viewport_size.x / 2 - grid.rect_size.x / 4,
        viewport_size.y / 2 - grid.rect_size.y / 4
    ))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
