extends Node2D


func _process(delta):
	$CanvasLayer/MarginContainer/VBoxContainer/Label2.text = "Score: " + str(Global.score)


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
