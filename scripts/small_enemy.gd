extends CharacterBody2D

const speed = 1.75


func _physics_process(delta):
	position.y += speed


func _on_area_2d_area_entered(area):
	if area.is_in_group("projectiles"):
		for i in Global.allEnemies:
			if i == self:
				Global.allEnemies.erase(i)
				print(Global.allEnemies)
		Global.score += 1
		Global.totalEnemy -= 1
		area.get_parent().queue_free()
		
		
		self.queue_free()
