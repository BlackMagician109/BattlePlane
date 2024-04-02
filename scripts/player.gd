extends CharacterBody2D

const speed = -1

@onready var anime = $AnimationPlayer
@onready var shootingPause = $shootingTimer

@export var bullet:PackedScene

var direction

func _ready():
	shootingPause.start(0.1)


func shoot():
	var bulletToInstanciate = bullet.instantiate()
	bulletToInstanciate.global_position = $bulletSpawn.global_position
	get_tree().root.add_child(bulletToInstanciate)

	pass

func _input(event):
	if event is InputEventMouseMotion:
		if event.get_relative().x > 0:
			anime.play("right")
		elif event.get_relative().x < 0:
			anime.play("left")


func _physics_process(delta):
	
	#position.x = get_local_mouse_position().x
	#position.y += speed
	position = get_global_mouse_position()
	
	move_and_slide()


func _on_shooting_timer_timeout():
	shoot()
	shootingPause.start(0.3)
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().change_scene_to_file("res://levels/game_over_menu.tscn")
		#SceneTree.change_scene_to_file("res://levels/game_over_menu.tscn")

