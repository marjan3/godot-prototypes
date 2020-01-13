extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var counter: Label = $TimerCounter;
var time: float = 0
var time_mult: float = 1.0
var should_pause: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not should_pause:
		time += delta * time_mult
	
	# Calculating second
	var seconds: int = int(time) % 60

	# Calculating minutes
	var minutes = int(time / 60.0)
	var minutes_str = ""
	if minutes > 0:
		minutes_str = str("%02d" % minutes) + ":"
	else:
		minutes_str = "00:"
		
	counter.text = minutes_str + str("%02d" % seconds)
