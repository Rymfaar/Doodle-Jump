extends StaticBody2D

signal plateform_destroyed

func _ready():
	print("Plateform >> _ready")


func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("plateform_destroyed")
	queue_free()
	print("Plateform >> _on_VisibilityNotifier2D_screen_exited >> queue_free")
