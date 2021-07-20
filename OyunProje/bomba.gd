extends Area2D

var screen_size

func _ready():
	screen_size = get_viewport().size
	pass
	
func _physics_process(delta): # Arena2D de hareket için
	# move and slide olmadığından position ekliyorum
	position.y += 350 * delta # bombayı saniyede 250 kere 
	# y yönünde hareket ettir
	
	if position.y > 1024: # bombayı pc yi kasmasın diye 
	# oyun alanının dışında yok ediyorum.
		queue_free() # Fonk u yok et anlamına gelir


func _on_bomba_body_entered(body):
	if body.name == "oyuncu":
		print("öldün")
		get_tree().change_scene("res://OyunProje.tscn")
