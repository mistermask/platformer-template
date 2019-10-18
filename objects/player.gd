extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var speed = 2000
const gravity = 150

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed * delta
	velocity.y += gravity * delta
	move_and_collide(velocity)
	
