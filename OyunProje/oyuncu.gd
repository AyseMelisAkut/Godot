extends KinematicBody2D

var hiz = 400
var hareket = Vector2()
var yercekimi = 1000
var ziplamakuvveti = 650
var puan = 0
var bitti

func _physics_process(delta):
	if is_on_floor():
		get_node("oyuncuSprite").playing = true
	# oyuncu yerdeyse animasyon oynasın
	else:
		get_node("oyuncuSprite").playing = false
	# oyuncu yerde değilse animasyon oynamasın

	hareket.x = 0 # oyuncunun sürekli hareketini engeller
	if Input.is_action_pressed("sag"):
		hareket.x = hiz # sağ hareket +x yönündedir

		get_node("oyuncuSprite").flip_h = false
		# Animasyonda flip h yi açtım. Eğer sağa basarsam 
		# animasyon çalışmasın yani default ta kalsın dedim

	if Input.is_action_pressed("sol"):
		hareket.x = -hiz # sol hareket -x yönündedir

		get_node("oyuncuSprite").flip_h = true
		# Animasyonda flip h yi açtım. Eğer sola basarsam 
		# animasyon çalışsın dedim

	hareket.y += yercekimi*delta # Fizikteki ve gerçek 
	# hayattaki gibi yerçekimi tanımladım

	if hareket.y > 500:
		hareket.y = 500 # sürekli hızlanmasın diye 500 de
		# dursun dedim

	if Input.is_action_just_pressed("ui_up"): # basılı tuttuğumda
	# uçmasın diye just pressed dedim.
		if is_on_floor(): # oyuncu havadayken zıplayamasın diye
		# sadece zeminde zıplamasını sağladım
			hareket.y = -ziplamakuvveti #zıplama -y yönündedir

	hareket = move_and_slide(hareket, Vector2(0,-1)) 
	# Oyuncuyu hareket ettirdim
	# Vector2(0,-1) = zıplama yukarda zemin aşağıda olarak 
	# tanımladım

	if hareket.length() > 5: # eğer hareket ediyorsa
		get_node("oyuncuSprite").animation = "yuruyor" 
		# AnimatedSprite default ayarım duruyorda. 
		# Eğer hareket dersem yürüyor animasyonunu çalıştırdı
	else: # eğer hareket etmiyorsa
		get_node("oyuncuSprite").animation = "duruyor"
		# AnimatedSprite default ayarım duruyorda kalsın.


func _on_zemin_body_entered(body): # zemin alanına, body name i 
# oyuncu olan bir düğüm girdiğinde(temas ettiğinde) öldür
	if body.name == "oyuncu":
		print("öldün")
		get_tree().change_scene("res://OyunProje.tscn")
		# Oyunu yeniden başlatır. En tepedeki düğüme gider ve
		# sahneyi oyun olarak değiştirir.


func _on_tuzak_body_entered(body):
	if body.name == "oyuncu":
		print("öldün")
		get_tree().change_scene("res://OyunProje.tscn")


func _on_bitis_body_entered(body):
	if body.name == "oyuncu":
		if puan == 16 :
			bitti = true
			print("oyun bitti")
			get_tree().change_scene("res://OyunProje.tscn")
		else :
			bitti = false
			print("bütün yıldızları toplamadan oyun bitmez")
