extends Node2D

@onready var cam = $Camera2D
@onready var enemySpawnPosititon1 = $enemySpawn
@onready var enemySpawnPosititon2 = $enemySpawn2
@onready var enemySpawnPosititon3 = $enemySpawn3
@onready var enemySpawnPosititon4 = $enemySpawn4


@export var enemy:PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.maxEnemy = 4
	Global.totalEnemy = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$bulletDespawn.position.y -= 1
	cam.position.y -= 1
	enemySpawnPosititon1.position.y -= 1
	enemySpawnPosititon2.position.y -= 1
	enemySpawnPosititon3.position.y -= 1
	enemySpawnPosititon4.position.y -= 1
	$enemyDespawn.position.y -= 1
	if Global.totalEnemy < Global.maxEnemy:
		spawnSmallEnemy()
		Global.totalEnemy += 1
	print(Global.totalEnemy)
	


func _on_area_2d_body_entered(body):
	body.queue_free()


func spawnSmallEnemy():
	var enemyToInstanciate = enemy.instantiate()
	var location = randi_range(0, 3)
	var locationArray = [enemySpawnPosititon1, enemySpawnPosititon2, enemySpawnPosititon3, enemySpawnPosititon4]
	enemyToInstanciate.global_position = locationArray[location].global_position
	enemyToInstanciate.position.x = randi_range(25, 150)
	#enemyToInstanciate.global_position.y = $enemySpawn.global_postition.y + randi_range(0, 50)
	get_tree().root.add_child(enemyToInstanciate)


func _on_enemy_despawn_body_entered(body):
	body.queue_free()
	Global.totalEnemy -= 1
	pass # Replace with function body.
