extends AnimatedSprite2D

var is_alive := true


func _ready() -> void:
    animation_finished.connect(func () : if is_alive :play("Vol"))

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_focus_next"):
        if is_alive:
            is_alive = false
            play("Eliminer")
        else : 
            play_backwards("Eliminer")
            is_alive = true
    
func _process (delta: float) -> void:
    if Input.is_action_pressed("ui_left"):
        position.x -= 120 * delta
    if Input.is_action_pressed("ui_right"):
        position.x += 120 * delta
    if Input.is_action_pressed("ui_up"):
        position.y -= 120 * delta
    if Input.is_action_pressed("ui_down"):
        position.y += 120 * delta


func _on_area_2d_area_entered(_area:Area2D) -> void:
    play("attaque")
