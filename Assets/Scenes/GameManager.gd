extends Node
var Error =load("res://Assets/sounds/FX/error.wav")
var GameOver =load("res://Assets/sounds/FX/gameover.wav")
var Sfx
export var Count = 0
export var MaxCount = 0
export var Score = "{}"
export var LivesText="Vidas: "
export var Lives= 1
export var Ground= ""
export var StartPosition= Vector2(0,0)
export var Waits:int=5
var MostrarTexto=false
var timer #este es el reloj

func _on_Ball2D_body_entered(body):
	if 	body.is_in_group(Ground):	
		$VBox/PerdisteLabel.text="Perdiste 1 vida"
		Lives-=1
		SoundPlay(Error)
		get_tree().paused=true
		$Timer.start()
		UpdateLives()
	if 	body.is_in_group("Red"):
		Count+=10
		
		#get_tree().get_nodes_in_group("SFX")[0].get_node("1").play()
		UpdateScore()
	if 	body.is_in_group("Blue"):
		Count+=20
		UpdateScore()
	if 	body.is_in_group("Green"):
		Count+=50	
	if	Count>=MaxCount:
		Dead("Ganaste")
		$Timer.start()
				#get_tree().get_nodes_in_group("SFX")[0].get_node("1").play()
		UpdateScore()	
		
func _ready():
	Sfx= AudioStreamPlayer.new()
	$VBox/PerdisteLabel.text=""
	$VBox/QuitLabel.text=""
	UpdateScore()
	UpdateLives()
	get_tree().paused=false

func UpdateScore():
	$HBox/ScoreLabel.text=Score +str(Count)
	
func UpdateLives():
	
	$HBox/LivesLabel.text=LivesText+ str(Lives)
	if Lives==0:
		SoundPlay(GameOver)
		Dead("Perdiste")
	
func _process(delta):
	pass
	

func _on_Timer_timeout():
	$VBox/PerdisteLabel.text=""
	$VBox/QuitLabel.text=""
	get_tree().paused=false
	
func Dead(Dead)	:
	$VBox/PerdisteLabel.text= Dead#"
	$VBox/QuitLabel.text="Press (r) to Restart"
	$Timer.start()
	get_tree().paused=true
	
func SoundPlay(var sound):
		Sfx.stream=sound
		Sfx.play()
		add_child(Sfx)
