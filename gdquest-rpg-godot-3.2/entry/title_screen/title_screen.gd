extends Control

var scene_path_to_load

func _ready():
	$Menu/CenterRow/Buttons/PlayButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		if $Menu/CenterRow/Buttons/QuitButton == button:
			button.connect("pressed", self, "_on_QuitButton_pressed")
		else:
			button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])


func _on_Button_pressed(scene_to_load):
	$FadeIn.show()
	$FadeIn.fade_in()
	scene_path_to_load = scene_to_load
	
func _on_QuitButton_pressed():
	get_tree().quit()


func _on_FadeIn_fade_finished():
	$FadeIn.hide()
	get_tree().change_scene(scene_path_to_load)
