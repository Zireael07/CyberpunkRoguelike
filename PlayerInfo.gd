extends PanelContainer

# Declare member variables here. Examples:

onready var hplabel = get_node("VBoxContainer/HPBox/HP")
onready var hpbar = get_node("VBoxContainer/HPBox/ProgressBar")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hp_changed(current: int,full: int):
	hplabel.set_text(str(current) + " / " + str(full))
	hpbar.set_max(full)
	hpbar.set_value(current)