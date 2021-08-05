extends RigidBody2D
export var Offset = Vector2(0,0)
export var Inpulse= Vector2(0,0)
export var Grupo= ""
export var Ground= ""
export var Walls= ""
var isGaming= false

func _process(delta):
	if Input.is_action_just_pressed("Ball")&& isGaming==false:
		print("juego iniciado")
		apply_impulse(Offset, Inpulse)
		isGaming=true
		print("ya no puedes disparar!")

func _on_Ball2D_body_entered(body):
	if body.is_in_group(Grupo):
			print("coliciono")
			apply_impulse(Offset/3, -Inpulse/4)
			body.queue_free()
	if 	body.is_in_group(Walls):	
		apply_impulse(Offset/4, Inpulse/4)
		print("Pared")	
	if 	body.is_in_group(Ground):	
		print("Perdiste!")	
		self.queue_free()
