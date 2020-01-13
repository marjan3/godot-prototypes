extends WorldEnvironment

onready var results: Label = $UI/Results
onready var ball = $Ball
onready var enemies_health_bar: TextureProgress = $UI/EnemiesHealthBar
onready var enemies_total_size = get_tree().get_nodes_in_group("enemies").size()

func _ready() -> void:
	enemies_health_bar.set_value(100.0)

func _on_Walls_ball_exited() -> void:
	results.set_text("Game Over")
	results.show()

func _on_Ball_enemy_touched(enemy, extra_arg):
	enemy.free()
	
	var enemies = get_tree().get_nodes_in_group("enemies")
	var enemies_current_size = enemies.size()
	var max_value = 100
	enemies_health_bar.set_value(enemies_current_size * (max_value/enemies_total_size))
	
	if(enemies_current_size == 0.0):
		results.set_text("Congradulations!\n\nYou Won!")
		results.show()
		get_tree().paused = true