extends Control


func _ready() -> void:
	pass 


func _on_btn_j_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn") 


func _on_btn_s_pressed() -> void:
	get_tree().quit() 
