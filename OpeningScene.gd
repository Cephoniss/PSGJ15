extends Node2D


func _ready():
	Dialogic.start("res://Timelines/Opening scene.dtl")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(argument:String):
	if argument == "trans_to_lab":
		get_tree().change_scene_to_file("res://rooms/lab.tscn")
