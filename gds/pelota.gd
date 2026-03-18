extends CharacterBody2D

var veloc = 300
var dir = Vector2.DOWN
var activa = true

var vidas = 3
signal vidasPerdidas
signal vidaRestada

func _ready() -> void:
	velocity = Vector2(veloc* -1, veloc)
	
func restarVida() -> void:	
	vidas -= 1
	vidaRestada.emit()
	if vidas == 0:
		vidasPerdidas.emit()
	
func _physics_process(delta: float) -> void:
	if activa:
		var collision = move_and_collide(velocity*delta)
		if collision:
			if collision.get_collider().name == "piso":
				restarVida()
			
			velocity = velocity.bounce(collision.get_normal())
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit()
			
		if (velocity.y > 0 and velocity.y < 100):
			velocity.y = -200; 
		if (velocity.x == 0):
			velocity.y = -200;
			
