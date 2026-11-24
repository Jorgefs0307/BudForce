extends CharacterBody2D

@export var speed: float = 110.0
@export var max_health: int = 3

var health: int = 3
var target: Node2D = null

func _ready() -> void:
	health = max_health
	var player_node := get_tree().current_scene.find_child("Player", true, false)
	if player_node is Node2D:
		target = player_node

func _physics_process(_delta: float) -> void:
	if target == null or not is_instance_valid(target):
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction := (target.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		queue_free()
		
