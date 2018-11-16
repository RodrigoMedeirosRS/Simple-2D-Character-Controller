extends Control

func _ready():
	#Caso o OS não seja Android, remove os inputs.
	if OS.get_name() != "Android":
		queue_free()