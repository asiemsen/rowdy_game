extends RigidBody2D

var grabbed = false

func _physics_process(delta):
	if grabbed == true:
		self.position = get_node("../player/Marker2D").global_position
		gravity_scale = 0
		set_axis_velocity(Vector2(0,0))
	else:
		gravity_scale = 1
		
func _integrate_forces(state):
	rotation_degrees = 0
	
func _input(event):
		#drop object
	if Input.is_action_just_pressed("grab") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
	#throw object
	if Input.is_action_just_pressed("throw_left") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		apply_central_impulse(Vector2(-400, -200))
		
	if Input.is_action_just_pressed("throw_right") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		apply_central_impulse(Vector2(400, -200))
		
	if Input.is_action_just_pressed("throw_up") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		apply_central_impulse(Vector2(0, -600))

	if Input.is_action_just_pressed("throw_down") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		self.position = get_node("../player/downMarker2D").global_position
		apply_central_impulse(Vector2(0, 400))
		
	#grab object
	if Input.is_action_just_pressed("grab"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and get_node("../player").canGrab == true:
				grabbed = true
				get_node("../player").canGrab = false

