extends Node2D


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_quit_pressed():
	get_tree().quit()
