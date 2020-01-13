extends "res://game/interface/menus/Menu.gd"

signal amount_confirmed(value)

onready var slider = $VBoxContainer/Slider/HSlider
onready var label = $VBoxContainer/Slider/Amount

func initialize(args=[]):
	var value = args[0]
	var max_value = args[1]
	label.initialize(value, max_value)
	slider.initialize(value, max_value)
	slider.grab_focus()

func open(args=[]):
	.open()
	var amount = yield(self, "amount_confirmed")
	close()
	return amount

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		emit_signal("amount_confirmed", 0)
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_accept"):
		emit_signal("amount_confirmed", slider.value)
		get_tree().set_input_as_handled()
