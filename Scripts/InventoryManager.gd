extends Node

var inventory = {}

func add_to_inventory(item_name: String):
	inventory[item_name] = true

func is_in_inventory(item_name: String) -> bool:
	return item_name in inventory and inventory[item_name]

func has_all_required_items(required_items: Array) -> bool:
	for item in required_items:
		if not is_in_inventory(item):
			print("Missing item: ", item)
			return false
	return true
