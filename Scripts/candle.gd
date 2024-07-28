extends Area2D
# I'd like to see if I can make a scene prefab of the script or object and use it for all interactable objects. 
# I will most likely just copy and paste this script to other objects since there will only be a handful.
var item_name: String = "candle"

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
			print("This is a candle!")
			obtain_item()

# Creating the function above to check if the click is inside the shape
func is_point_inside_shape(local_point: Vector2) -> bool:
	var shape = $CollisionShape2D.shape
	if shape is RectangleShape2D:
		var rect = Rect2(Vector2(-shape.extents.x, -shape.extents.y), shape.extents * 2)
		return rect.has_point(local_point)
	elif shape is CircleShape2D:
		return local_point.distance_to(Vector2.ZERO) <= shape.radius
	return false

func obtain_item():
	Dialogic.start("res://Timelines/Element - fire.dtl")
	var delete_me = $"../.."
	if delete_me:
		delete_me.queue_free()
