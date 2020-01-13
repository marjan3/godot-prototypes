extends Node

var _drag_status = 0
var _drag_offset = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _input(event):
	if event.is_class("InputEventMouse"):
		if _drag_status == 0 and event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed:
			_drag_status = 1
			_drag_offset = OS.window_position - (event.global_position + OS.window_position)
		if _drag_status == 1 and event.is_class("InputEventMouseMotion"):
			_drag_status = 2
		if _drag_status == 2 and event.get_button_mask() != BUTTON_LEFT:
			_drag_status = 0

func _process(delta):
	if _drag_status == 2:
		OS.window_position = (get_viewport().get_mouse_position() + OS.window_position) + _drag_offset
