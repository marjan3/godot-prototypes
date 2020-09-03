extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var accum = 0
var s
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var scene = load("res://myscene.scn")
	var node = scene.instance()
	add_child(node)
	
	set_process(true)
	
	get_node("Button").connect("pressed", self, "_on_button_pressed")
	
	add_to_group("panels")
	
	get_tree().call_group(0, "buttons", "player_was_discovered")
	
	var buttons = get_tree().get_nodes_in_group("buttons")
	
	s = Sprite.new()
	add_child(s)
	
func _on_button_pressed():
	#s.free()
    #s.queue_free() # safey delete
    get_node("Button").set_text("HELLO!")

func _process(delta):
	accum+=delta
	get_node("Label").set_text(str(accum))
	
func _notification(what):
	if(what = NOTIFICATION_READY):
		print("This is the same as overriding read()...")
	elif(what == NOTIFICATION_PROCESS):
		var delta = get_process_time()
		print("This is same as overiding _process()")