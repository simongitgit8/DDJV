extends Node2D


@export var vitesse := 100.0
@export var grosseur_max := 1.5
@export var grosseur_min := 0.2

func _draw() -> void: 
    var grosseur := randf_range(grosseur_min,grosseur_max)
    scale = Vector2(grosseur,grosseur)


func _process(delta:float) -> void:
    var temps_courrant_seconde = Time.get_ticks_msec() / 1000.0
    position += Vector2(vitesse, 0) * delta




