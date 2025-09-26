extends Node2D

const tour_complet := 2 * PI
var pos_pacman := Vector2(200,350)
var pos_biscuit := Vector2(100,100)

var delta_angle_sourire := PI/3
var angle_sourire_amplitude := PI/10
var angle_sourire_periode := 0.5 

var delta_angle_pacman := PI/2
var angle_pacman_amplitude := PI/5
var angle_pacman_periode := 0.5

func _draw() -> void:
    
    #Défi 1 : Arrière-plan
    draw_rect(get_viewport_rect(), Color.GREEN)

    


    #Défi 2 : Biscuit au chocolat
    draw_circle(pos_biscuit, 10, Color.BEIGE, true)
    draw_circle(pos_biscuit+ Vector2(1,5), 2, Color.CHOCOLATE, true)
    draw_circle(pos_biscuit+ Vector2(3,-4), 3, Color.CHOCOLATE, true)
    draw_circle(pos_biscuit+ Vector2(-5,-2), 3, Color.CHOCOLATE, true)

    #Défi 3 : PacMac statique
    # draw_circle(pos_pacman, 80, Color.YELLOW, true)
    draw_arc(pos_pacman,80, tour_complet/12 - delta_angle_pacman, tour_complet/16*15 + delta_angle_pacman ,50,Color.YELLOW,160,true)
    draw_circle(pos_pacman + Vector2(10,-50), 11, Color.BLACK, true)

    var centre := get_viewport_rect().get_center()
    var pos_oeuil_droit := centre + Vector2(50,-50)
    var pos_oeuil_gauche := centre + Vector2(-50,-50)

    var pos_relative_oeil_biscuit := pos_biscuit - pos_oeuil_droit
    var direction_vers_biscuit := pos_relative_oeil_biscuit.normalized()
    var pos_retine_droite = pos_oeuil_droit + direction_vers_biscuit*15
    draw_circle(pos_oeuil_droit, 25, Color.BURLYWOOD, false)
    draw_circle(pos_retine_droite, 5, Color.BLACK,true)
    #draw_line(pos_oeuil_droit, pos_oeuil_droit + direction_vers_biscuit*15, Color.DEEP_PINK, 3)

    var pos_relative_oeil_biscuit2 := pos_biscuit - pos_oeuil_gauche
    var direction_vers_biscuit2 := pos_relative_oeil_biscuit2.normalized()
    var pos_retine_gauche = pos_oeuil_gauche + direction_vers_biscuit2*15
    draw_circle(pos_oeuil_gauche, 25, Color.BURLYWOOD, false)
    draw_circle(pos_retine_gauche, 5, Color.BLACK,true)
    

    draw_arc(centre+ Vector2(0,50), 100, tour_complet*0.1-delta_angle_sourire , tour_complet*0.4+delta_angle_sourire,30,Color.AQUAMARINE,20)


    draw_polyline(
        [
            centre + Vector2(150,-120),
            centre + Vector2(150,180),
            centre + Vector2(0,250),
            centre + Vector2(-150,180),
            centre + Vector2(-150,-120),
            centre + Vector2(150,-120)
        ],Color.BLUE
    )

func _process(delta: float) -> void:
    #pos_biscuit.x += 20 * delta
    #pos_biscuit.y += 40 * delta

    var velocite := 200.0
    var deplacement := velocite * delta
    if Input.is_action_pressed('ui_right'):
        pos_biscuit.x += deplacement
    if Input.is_action_pressed('ui_left'):
        pos_biscuit.x -= deplacement
    if Input.is_action_pressed('ui_up'):
        pos_biscuit.y -= deplacement
    if Input.is_action_pressed('ui_down'):
        pos_biscuit.y += deplacement


    #pos_biscuit += Vector2(20 * delta,40 * delta)
    var temps_courrant_seconde = Time.get_ticks_msec() / 1000.0
    delta_angle_sourire = angle_sourire_amplitude * sin( tour_complet * temps_courrant_seconde / angle_sourire_periode )
    delta_angle_pacman = angle_pacman_amplitude * sin (  tour_complet * temps_courrant_seconde / angle_pacman_periode)

    var pos_rel_pac_biscuit := pos_biscuit - pos_pacman
    var direction_vers_biscuit3 := pos_rel_pac_biscuit.normalized()
    pos_pacman += direction_vers_biscuit3 * delta * 50


    #Forcer l'appel de _draw
    queue_redraw()
