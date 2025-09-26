extends AnimatedSprite2D

@export var myMoveable : Moveable

func _ready():
	myMoveable = get_node("Moveable")

func die(_area:Area2D) :
	myMoveable.velocite = 0
	play("meurt")
