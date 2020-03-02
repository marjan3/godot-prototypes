extends Node2D

onready var root_animation_player = get_node("RootAnimationPlayer")

onready var play_button = get_node("Play")
onready var options_button = get_node("Options")
onready var quit_button = get_node("Quit")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	play_button.disabled = true
	quit_button.disabled = true
	root_animation_player.play("leave")


func _on_Play_pressed():
	options_button.disabled = true
	quit_button.disabled = true
	root_animation_player.play("leave")
