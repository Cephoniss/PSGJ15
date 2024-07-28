extends Node2D
var item_name: String = "feather"

func _ready():
	set_process_input(true)

func _input(event):
	# Check if the event is a mouse click and get position of mouse
	if event is InputEventMouseButton and event.pressed:
		var click_position = event.position
		# This is var is to convert click position to local space
		var local_click_position = to_local(click_position)
		# Check if the click is inside the object's collision shape
		if is_point_inside_shape(local_click_position):
			# Print a debug message to the console
			print("This is a feather!")
			obtain_item()

# Creating the function above to check if the click is inside the shape
func is_point_inside_shape(local_point: Vector2) -> bool:
	var shape = $CollisionShape2D.shape
	if shape is RectangleShape2D:
		var rect = Rect2(Vector2(-shape.extents.x, -shape.extents.y), shape.extents * 2)
		return rect.has_point(local_point)
	elif shape is CircleShape2D:
		return local_point.distance_to(Vector2.ZERO) <= shape.radius
	# Add other shapes if needed
	return false
func obtain_item():
	InventoryManager.add_to_inventory(item_name)
	print(item_name + " has been added to inventory!")
	var control_node = $"../../../Control"
	control_node.check_required_items()
	Dialogic.start("res://Element - air 2.dtl")
