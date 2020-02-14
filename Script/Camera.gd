extends Camera2D

export(NodePath) var PLAYER_PATH

var player

func _ready():
	player = get_node(PLAYER_PATH)
	print("Camera2D >> _ready")


func _process(delta):
	var player_pos_y = player.get_position().y
	if player_pos_y < get_position().y :
		self.position.y = player_pos_y
