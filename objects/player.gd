extends KinematicBody2D

var velocity = Vector2()
const GRAVITY = -10
var speed = 200
var jump_speed = -450
const out_of_bounds = 700

func _physics_process(delta):
	velocity.y -= GRAVITY
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			print("ready")
			velocity.y = jump_speed
		else:
			velocity.y = 0


func _process(delta):
	if(position.y > out_of_bounds):
		position = Vector2(510,200)
	move_and_slide(velocity,Vector2(0,-1))