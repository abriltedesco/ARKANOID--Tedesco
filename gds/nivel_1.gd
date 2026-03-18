extends Node2D
@onready var ladrilloObj = preload("res://escenas/ladrillo.tscn")

const cols = 8
const filas = 5
const ancho = 128
const alto = 32
const sepX = 4
const sepY = 6
const margenTecho = 40

var posInicialPelota: Vector2
var velInicialPelota

func _ready() -> void:
	generar_grilla()
	posInicialPelota = $pelota.position
	velInicialPelota = $pelota.veloc
		
		
# calculo para q quede lindo y centrado la matriz de ladrillos por ancho y alto
func generar_grilla() -> void:
	var ancho_total = cols * ancho + (cols - 1) * sepX 
	var origen_x = (1152 - ancho_total) / 2.0 + ancho / 2.0 
	var inicio_y := margenTecho + alto / 2.0

	for fila in filas:
		for col in cols:
			var ladrillo := ladrilloObj.instantiate()
			add_child(ladrillo)

			# global_position para ignorar transformación del nodo padre
			ladrillo.global_position = Vector2(origen_x + col * (ancho + sepX), inicio_y + fila * (alto  + sepY))

func _on_vidas_perdidas() -> void:
	# !!!!!!!!!!!!!! no está entrando acá help
	print("perdiste tu vida")
	
func volverPelotaPosicionPpal() -> void:
	$pelota.position = posInicialPelota
	$pelota.veloc = velInicialPelota
	pass 

func _on_pelota_vida_restada() -> void:
	volverPelotaPosicionPpal()
	print("perdiste una de tus vidas") # 
