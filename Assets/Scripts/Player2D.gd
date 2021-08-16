extends KinematicBody2D

export (int) var Speed = 2
var velocity=Vector2()
#var b = "text"
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("D"):
		velocity.x += 1
		
	if Input.is_action_pressed("A"):
		velocity.x -= 1
		
	velocity = velocity.normalized() * Speed

func _ready():
	pass 

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
