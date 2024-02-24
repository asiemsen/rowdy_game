extends CharacterBody2D

var canGrab = true

const speed = 750
const jump_power = -3000

const acc = 90
const friction = 95 # more than acc

const gravity = -180

const max_jumps = 1
var current_jumps = 1

func _physics_process(delta):
	var input_dir: Vector2 = input()
	print(input_dir)
	if input_dir != Vector2.ZERO:
		accelerate(input_dir) 
		
		#play_animation()
	else:
		add_friction()
		#play slowdown
	player_movement()
	jump(delta)
	
	if (!is_on_floor()):
		velocity.y -= gravity
	
func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	
	input_dir.x = Input.get_axis("left", "right")
	input_dir = input_dir.normalized()
	return input_dir 

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)
	#velocity.x = move_toward(velocity.x, speed*direction, acc*delta)
	
	
func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	
func player_movement():
	move_and_slide() 
	
#func play_animation():
	#pass
func jump(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_power



