extends CharacterBody2D

const speed = 300

@onready var anime = $AnimationPlayer

var direction

func _input(event):
	if event is InputEventMouseMotion:
		if event.get_relative().x > 0:
			anime.play("right")
		elif event.get_relative().x < 0:
			anime.play("left")


func _physics_process(delta):
	
	position = get_global_mouse_position()
	
	#direction = Input.get_axis("left", "right")
	#
	#InputEventMouse
	#
	#if is_on_floor():
		#anime.play("idle")
	#
	#if direction:
		#velocity.x = direction * speed
		#anime.play("right")
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
		#anime.play("left")

	move_and_slide()
