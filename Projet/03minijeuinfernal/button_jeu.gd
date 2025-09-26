extends Button

var tableau := ["Nanananana na!", "no!", "noooo", "nahhhh"]



func _ready() -> void:
	text = tableau[randf_range(0, len(tableau))]

func _on_mouse_entered() -> void:
	
	text = tableau[randf_range(0, len(tableau))]
	var rect := get_viewport().get_visible_rect()
	position = Vector2(randf_range(rect.position.x,rect.end.x - size.x), randf_range(rect.position.y,rect.end.y - size.y)) 


func _on_area_2d_area_entered(_area:Area2D) -> void:
	text = "Au secours!!!!"
	disconnect("mouse_entered", _on_mouse_entered)
	
func _on_pressed() -> void:
	text ="Bravo!"
