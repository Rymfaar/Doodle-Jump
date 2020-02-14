extends Node2D

const PLATEFORM = preload('res://Scene/Plateform.tscn')
export(NodePath) var CAMERA_PATH
export(NodePath) var FIRST_PLATEFORM_PATH
export(NodePath) var PLATEFORM_CONTAINER
const MAX_HEIGHT_OFFSET = 150
const AMOUNT_TO_FILL = 15

var camera
var first_plateform
var screen_width
var screen_height

func _ready():
	print("SpawnerPlateform >> _ready")
	camera = get_node(CAMERA_PATH)
	first_plateform = get_node(FIRST_PLATEFORM_PATH)
	screen_width = get_viewport().size.x
	screen_height = get_viewport().size.y
	self.position.x = first_plateform.get_position().x
	self.position.y = first_plateform.get_position().y - MAX_HEIGHT_OFFSET
	for iter in range(AMOUNT_TO_FILL):
		spawn_then_move()

func spawn():
	randomize()
	var new_plateform_x = rand_range(0, screen_width)
	var new_plateform = PLATEFORM.instance()
	new_plateform.connect("plateform_destroyed", self, "spawn_then_move")
	new_plateform.set_position(Vector2(new_plateform_x, self.get_position().y))
	self.get_node(PLATEFORM_CONTAINER).add_child(new_plateform)


func move():
	self.position.y -= rand_range(0, MAX_HEIGHT_OFFSET)


func spawn_then_move():
	spawn()
	move()
