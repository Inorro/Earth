extends StaticBody2D

var _click_position: Array = []

var last_point = Vector2(1000,500)
@onready var coll = $CollisionShape2D
@onready var line = $Line2D
var mouse_left_down: bool = false
var line_done = true

func _input( event ):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
			last_point = get_global_mouse_position()
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
			line_done = false

func _physics_process(delta):
	if line_done:
		#last_point = Vector2(1000,500)
		if mouse_left_down:
			var new_point = get_global_mouse_position()
			line.add_point(new_point)
			var new_coll = coll.duplicate()
			var new_shape = coll.shape.duplicate()
			new_coll.shape = new_shape
			new_coll.shape.a = new_point
			new_coll.shape.b = last_point
			add_child(new_coll, true)
			last_point = new_point
			queue_redraw()

	
#func _draw():
	#var Temp : PackedVector2Array = []
	#for point in _click_position:
		#Temp.append(point)
	#draw_polyline(Temp,Color.WHITE,5.0)
	#var shape = RectangleShape2D.new()
	
