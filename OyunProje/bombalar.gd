extends Node2D

var bombasahnesi = preload("res://bomba.tscn")
# bomba adlı sahneyi buraya bombasahnesi adıyla yükledim

func _ready(): # oyunun başında sadece 1 kez çalışır
	var bomba = bombasahnesi.instance() 
	add_child(bomba) # bombayı ekledim
	randomize() # bombaların rastgele gelmesidir
	$Timer.start()


func _on_Timer_timeout():
	var bomba = bombasahnesi.instance() 
		# bombasahnesinden bir tane örnek bomba oluşturdum 
		# ama daha eklemedim
	bomba.position.y = -1024 # bombalar arasında 1024
	# birimlik boşluk bıraktım
	bomba.position.x = randi() % 1024 # randi fonk 2 
	# değer arasında random sayı üretir. 
	add_child(bomba) # bombayı ekledim
	
