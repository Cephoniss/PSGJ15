extends Node

var bucket: bool = false
var feather: bool = false
var candle: bool = false
var soil: bool = false

func add_to_inventory(item_name: String):
	match item_name:
		"bucket":
			bucket = true
		"feather":
			feather = true
		"candle":
			candle = true
		"soil":
			soil = true

func has_all_required_items() -> bool:
	return bucket and feather and candle and soil
