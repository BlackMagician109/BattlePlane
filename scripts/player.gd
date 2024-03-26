extends CharacterBody2D

const speed = -3

@onready var anime = $AnimationPlayer

var direction

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
