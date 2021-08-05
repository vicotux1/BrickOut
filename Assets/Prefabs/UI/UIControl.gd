extends Control

func _on_QuitButton_pressed():
	print("Cerrando Juego")
	get_tree().quit()


func _on_ResetButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/Level012D.tscn")
	
