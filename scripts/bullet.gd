extends Area2D

@export var speed: float = 400.0
@export var damage: int = 1

var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("Bala tocó a: ", body.name, " | Grupos: ", body.get_groups())
	if body.is_in_group("enemies"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
