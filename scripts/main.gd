extends Node2D

@export var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
@export var spawn_interval: float = 1.5
@export var spawn_radius: float = 350.0

@onready var player: Node2D = $Player

func _ready() -> void:
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_spawn_enemy_timeout)
	add_child(timer)

func _on_spawn_enemy_timeout() -> void:
	if enemy_scene == null or player == null:
		return

	var enemy = enemy_scene.instantiate()
	var angle := randf() * TAU
	enemy.global_position = player.global_position + Vector2.RIGHT.rotated(angle) * spawn_radius
	add_child(enemy)
