extends Control

func _on_QuitButton_pressed():
	get_node("ResetButton/Buttonplay").play()
	print("Cerrando Juego")
	get_tree().quit()

func _on_ResetButton_pressed():
	get_node("ResetButton/Buttonplay").play()
	get_tree().change_scene("res://Assets/Scenes/Level012D.tscn")
	


	



