extends KinematicBody2D
var motion = Vector2()
const UP = Vector2(0,-1)
export var GRAVITY = 25
const MAXSPEED = 100
export var JUMPFORCE = 300
const MAXFALL = 200
export var ACCEL = 10

func _physics_process(delta):
	motion = move_and_slide(motion , UP)
	motion.y += GRAVITY
	if motion.y > MAXFALL:
		motion.y = MAXFALL
		
	motion.x = clamp(motion.x , -MAXSPEED , MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
	else:
		motion.x = lerp(motion.x , 0 , 0.2)
	if Input.is_action_just_pressed("up") and is_on_floor():
		motion.y = -JUMPFORCE
