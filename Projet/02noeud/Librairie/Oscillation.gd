extends Node2D

const tour_complet := 2 * PI

var delta_angle := 0.2
@export var angle_amplitude := PI / 18
@export var angle_periode := 0.3

var random_angle_amplitude := PI / 30
var random_angle_periode := 0.07

var variation_angle_amplitude := 0.0
var variation_angle_periode := 0.0

@export var node_to_affect : Node2D

func _ready() -> void:
	variation_angle_amplitude = randf_range(-random_angle_amplitude,random_angle_amplitude)
	variation_angle_periode = randf_range(-random_angle_periode,random_angle_periode)


func _process(delta: float) -> void:
	var temps_courrant_seconde = Time.get_ticks_msec() / 1000.0
	delta_angle = (angle_amplitude+variation_angle_amplitude)* sin( tour_complet * temps_courrant_seconde / (angle_periode+variation_angle_periode) )
	node_to_affect.rotation = delta_angle 
