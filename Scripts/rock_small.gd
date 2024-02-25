extends RigidBody2D

var grabbed = false

func _physics_process(delta):
	if grabbed == true:
		self.position = get_node("../player/Marker2D").global_position
		gravity_scale = 0
	else:
		gravity_scale = 1
func _input(event):
		#drop object
	if Input.is_action_just_pressed("grab") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		if get_node("../player/Sprite2D").flip_h == true:
			apply_impulse(Vector2(), Vector2(20, -5))
		else:
			apply_impulse(Vector2(), Vector2(-20, -5))
	#throw object
	if Input.is_action_just_pressed("grab") and grabbed == true:
		grabbed = false
		get_node("../player").canGrab = true
		if get_node("../player").sprite.flip_h == false:
			apply_impulse(Vector2(), Vector2(150, -200))
		else:
			apply_impulse(Vector2(), Vector2(-150, -200))
	#grab object
	if Input.is_action_just_pressed("grab"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and get_node("../player").canGrab == true:
				grabbed = true
				get_node("../player").canGrab = false

