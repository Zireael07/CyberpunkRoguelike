extends Control

# class member variables go here, for example:
onready var messagebox = get_node('frame/right/Panel/MessageBox')

# Called when the node enters the scene tree for the first time.
func _ready():
	
	RPG.game = self
	messagebox.set_scroll_follow(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
