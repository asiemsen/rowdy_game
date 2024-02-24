extends CharacterBody2D


const speed = 750
const jump_power = -2000

const acc = 50
const friction = 55 # more than acc

const gravity = -120

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
	jump()
	
func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	
	input_dir.x = Input.get_axis("left", "right")
	input_dir = input_dir.normalized()
	return input_dir 

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)
	
func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	
func player_movement():
	move_and_slide() 
	
#func play_animation():
	#pass
func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_power
	else:
		velocity.y -= gravity


