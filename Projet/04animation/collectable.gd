extends Sprite2D

@onready var bat = get_node("../Bat")
@onready var lifebar = get_node("../SpriteSheet")

func _ready() -> void:
    frame = randi() % 9

func _on_area_2d_area_entered(_area:Area2D) -> void:
    if _area.get_parent() == bat :
        lifebar.frame -= 1
        queue_free()
