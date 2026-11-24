extends CharacterBody2D

@export var move_speed: float = 260.0
@export var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
@export var fire_cooldown: float = 0.18

var _fire_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if _fire_timer > 0.0:
		_fire_timer -= delta

	# Movimiento con WASD (o acciones move_* si las tienes en el Mapa de Entrada)
	var move_dir := Vector2.ZERO
	if InputMap.has_action("move_left") and InputMap.has_action("move_right"):
		move_dir.x = Input.get_axis("move_left", "move_right")
	else:
		move_dir.x = float(Input.is_key_pressed(KEY_D)) - float(Input.is_key_pressed(KEY_A))

	if InputMap.has_action("move_up") and InputMap.has_action("move_down"):
		move_dir.y = Input.get_axis("move_up", "move_down")
	else:
		move_dir.y = float(Input.is_key_pressed(KEY_S)) - float(Input.is_key_pressed(KEY_W))

	velocity = move_dir.normalized() * move_speed
	move_and_slide()

	# Apuntado y disparo SOLO al pulsar las flechas (8 direcciones)
	var aim_dir := _get_aim_direction()
	if aim_dir != Vector2.ZERO and _fire_timer <= 0.0:
		_shoot(aim_dir.normalized())
		_fire_timer = fire_cooldown

func _get_aim_direction() -> Vector2:
	var dir := Vector2.ZERO

	if InputMap.has_action("aim_left") and InputMap.has_action("aim_right"):
		dir.x = Input.get_axis("aim_left", "aim_right")
	else:
		dir.x = float(Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_key_pressed(KEY_LEFT))

	if InputMap.has_action("aim_up") and InputMap.has_action("aim_down"):
		dir.y = Input.get_axis("aim_up", "aim_down")
	else:
		dir.y = float(Input.is_key_pressed(KEY_DOWN)) - float(Input.is_key_pressed(KEY_UP))

	return dir

func _shoot(dir: Vector2) -> void:
	if bullet_scene == null:
		return

	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	if "direction" in bullet:
		bullet.direction = dir
	bullet.rotation = dir.angle()

	get_parent().add_child(bullet)
