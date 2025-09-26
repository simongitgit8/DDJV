extends Button

func _disable_me(_area:Area2D):
    disabled = true

func _on_pressed() -> void:
    get_tree().quit()