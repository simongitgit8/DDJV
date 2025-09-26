extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	#Je me disable
	var me_btn = get_parent() as Button
	if me_btn:
		me_btn.disabled = true
	
