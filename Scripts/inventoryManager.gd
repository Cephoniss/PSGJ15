extends Node

var bucket: bool = false
var feather: bool = false
var candle: bool = false
var soil: bool = false


func collect_item(item_name: String):
	match item_name:
		"bucket":
			bucket = true
		"feather":
			feather = true
		"candle":
			candle = true
		"soil":
			soil = true

func check_items(item_name: String) -> bool:
	match item_name:
		"bucket":
			return bucket
		"feather":
			return feather
		"candle":
			return candle
		"soil":
			return soil
		_:
			return false

