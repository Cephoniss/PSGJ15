extends Area2D

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
			print("This is a door!")
			get_tree().change_scene_to_file("res://rooms/outside.tscn")

func is_point_inside_shape(local_point: Vector2) -> bool:
	var shape = $CollisionShape2D.shape
	if shape is RectangleShape2D:
		var rect = Rect2(Vector2(-shape.extents.x, -shape.extents.y), shape.extents * 2)
		return rect.has_point(local_point)
	return false
