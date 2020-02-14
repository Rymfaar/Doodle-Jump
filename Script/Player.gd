extends RigidBody2D

const WORLD = 'res://Scene/World.tscn'
const JUMP_FORCE = 600
const MOVE_FORCE = 300
const FALL_OFFSET = 250

var screen_width
var screen_height

func _ready():
	screen_width = get_viewport().size.x
	screen_height = get_viewport().size.y
	print("Player >> _ready")


# warning-ignore:unused_argument
func _process(delta):
	# out on right
	if get_position().x > screen_width :
		self.position.x = 0
		print("Player >> _process >> tp to left")
	# out on left
	if get_position().x < 0 :
		self.position.x = screen_width
		print("Player >> _process >> tp to right")


# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		set_linear_velocity(Vector2(-MOVE_FORCE, get_linear_velocity().y))
		$Sprite.set_flip_h(true)
	if Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(MOVE_FORCE, get_linear_velocity().y))
		$Sprite.set_flip_h(false)
	if not Input. is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(0, get_linear_velocity().y))


func _on_Area2D_body_entered(body):
	if body.is_in_group("plateform") and get_linear_velocity().y > 0:
		set_linear_velocity(Vector2(0, -JUMP_FORCE))
		print("Player >> _on_Area2D_body_entered >> collision with plateform")


func _on_VisibilityNotifier2D_screen_exited():
	print(get_position().y)
	if get_position().y < screen_height + FALL_OFFSET:
		get_tree().change_scene(WORLD)
		print("Player >> _on_VisibilityNotifier2D_screen_exited >> reload tree")
