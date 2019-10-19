extends KinematicBody2D

var velocity = Vector2()

const JUMP_SPEED = 100
const ACCLERATION = 10
const SPEED_CAP = 200

func _physics_process(delta):
	velocity.y += 50
	if Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + ACCLERATION, SPEED_CAP)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(velocity.x - ACCLERATION, -SPEED_CAP)
	else:
		#velocity.x = 
		
	
	move_and_slide(velocity)
	pass