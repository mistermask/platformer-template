extends KinematicBody2D

var velocity = Vector2()

const JUMP_SPEED = -500
const ACCLERATION = 30
const SPEED_CAP = 200
const GRAVITY = 10
const DEACCLERATION = 60
const UP = Vector2(0,-1)

var time_since_last_jump = 0

func _physics_process(delta):
	velocity.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(velocity.x + ACCLERATION, SPEED_CAP)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(velocity.x - ACCLERATION, -SPEED_CAP)
	else:
		if velocity.x > 0:
			velocity.x = max(velocity.x - DEACCLERATION, 0)
		elif velocity.x < 0:
			velocity.x = min(velocity.x + DEACCLERATION, 0)
	
	if is_on_floor() or is_on_wall():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_SPEED
			time_since_last_jump = .3
	
	velocity = move_and_slide(velocity,UP)
	time_since_last_jump -= delta
	pass