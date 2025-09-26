class_name  LifeBarB
extends Sprite2D

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept") && frame >0:
        frame -= 1