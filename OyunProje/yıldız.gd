extends Node2D

func _ready():
	pass

func _on_yldz_body_entered(body):
	if body.name == "oyuncu":
		print("puan kazandın")
		get_parent().get_parent().get_child(1).puan += 1
		get_node("../../CanvasLayer/Label").text = str(get_parent().get_parent().get_child(1).puan)
		queue_free() # body altına değdiğinde yok ol
