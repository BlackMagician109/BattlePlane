extends CharacterBody2D


const speed = -20

func _physics_process(delta):
	position.y += speed
