extends Node2D

var CatScene := preload("res://Chat.tscn")

func _ready() -> void:
    var mushroom = $Mushroom3
    mushroom.modulate = Color.BLUE
    mushroom.get_parent().modulate = Color.BLUE_VIOLET

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_focus_next"):
        var rect := get_viewport_rect()
        var rx := randf_range(rect.position.x , rect.end.x)
        var ry := randf_range(rect.position.y , rect.end.y)
        var random_pos := Vector2(rx,ry)
        var my_cat := CatScene.instantiate()
        my_cat.position = random_pos
        add_child(my_cat)

    