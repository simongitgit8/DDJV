extends Node2D

var ProjectileScene := preload("res://Projectile.tscn")
@onready var main := $"Epaule/Bras/Main"

@export var velocite_rotation_epaule := PI*0.5
@export var velocite_rotation_bras := PI*0.5

@onready var epaule := $Epaule
@onready var bras := $Epaule/Bras


func _process(delta: float) -> void:
    var deplacement_epaule := velocite_rotation_epaule * delta
    var deplacement_bras := velocite_rotation_bras * delta

    if Input.is_action_pressed('ui_right'):
        epaule.rotation += deplacement_epaule
    if Input.is_action_pressed('ui_left'):
        epaule.rotation -= deplacement_epaule
    if Input.is_action_pressed('ui_up'):
        bras.rotation  -= deplacement_bras
    if Input.is_action_pressed('ui_down'):
        bras.rotation  += deplacement_bras

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept"):
        var projectile := ProjectileScene.instantiate()
        projectile.global_position = main.global_position
        get_parent().add_child(projectile)