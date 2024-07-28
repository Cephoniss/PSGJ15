extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
		if event is InputEventKey and event.pressed:
			check_required_items()

func check_required_items():
	if InventoryManager.has_all_required_items():
		print("All required items are in the inventory!")
		alchemy_enabled()
	else:
		print("Some required item are missing..")
		handle_missing_items()

func handle_missing_items():
	print ("checking for missing items")

func alchemy_enabled():
	print("Alchemy enabled")
	#get_tree().change_scene_to_file("res://alchemy.tscn")



