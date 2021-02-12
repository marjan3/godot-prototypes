extends '../Monster.gd'

enum STATES { IDLE, RETURN, SPOT, FOLLOW, DIE}

export(float) var FOLLOW_RANGE = 300.0
export(float) var MAX_FLY_SPEED = 360.0

func _ready():
	_change_state(STATES.IDLE)

func _change_state(new_state):
	match new_state:
		STATES.IDLE:
			pass
		STATES.DIE:
			queue_free()
			emit_signal('died')
	state = new_state

func _physics_process(delta):
	var current_state = state
	match current_state:
		STATES.IDLE:
			if not target:
				return
			if position.distance_to(target.position) <= FOLLOW_RANGE:
				_change_state(STATES.FOLLOW)
		STATES.FOLLOW:
			if not target:
				return
			if position.distance_to(target.position) > FOLLOW_RANGE:
				_change_state(STATES.RETURN)
				return

			velocity = Steering.follow(velocity, position, target.position, MAX_FLY_SPEED)
			move_and_slide(velocity)
			rotation = velocity.angle()
		STATES.RETURN:
			velocity = Steering.arrive_to(velocity, position, start_position)
			move_and_slide(velocity)
			rotation = velocity.angle()

			if position.distance_to(start_position) < ARRIVE_DISTANCE:
				_change_state(STATES.IDLE)

func _on_DamageSource_area_entered(area):
	_change_state(STATES.DIE)

func _on_Stats_damage_taken(new_health):
	_change_state(STATES.DIE)
