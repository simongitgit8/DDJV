extends Node2D
class_name Moveable

@export var target_node : AnimatedSprite2D

var is_alive := true
var velocite := 200
var direction := "down"
	
func _process (delta: float) -> void:

	match direction:
		"down":
			target_node.position.y += velocite * delta
		"up":
			target_node.position.y -= velocite * delta
		"left":
			target_node.position.x -= velocite * delta
		"right":
			target_node.position.x += velocite * delta


	if Input.is_action_pressed("ui_left"):
		target_node.play("walk_left")
		direction = "left"
	if Input.is_action_pressed("ui_right"):
		target_node.play("walk_right")
		direction = "right"
	if Input.is_action_pressed("ui_up"):
		target_node.play("walk_up")
		direction = "up"
	if Input.is_action_pressed("ui_down"):
		target_node.play("walk_down")
		direction = "down"
