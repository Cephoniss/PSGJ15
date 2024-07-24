extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _process_input(event):
		if event is InputEventKey and event.pressed and event.scancode == KEY_I:
			check_required_items()

func check_required_items():
	var required_items = ["feather", "soil", "bucket", "candle"]
	if InventoryManager.has_all_required_items(required_items):
		print("All required items are in the inventory!")



