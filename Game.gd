extends Control

# class member variables go here, for example:
onready var messagebox = get_node('frame/right/Panel/MessageBox')
onready var playerinfo = get_node('frame/left/PlayerInfo')

# Called when the node enters the scene tree for the first time.
func _ready():
	
	RPG.game = self
	messagebox.set_scroll_follow(true)
	
	# because we need playerinfo connection, we can't do it from player scene
	RPG.player.fighter.connect("hp_changed", RPG.game.playerinfo, "hp_changed")
	RPG.player.fighter.emit_signal("hp_changed",RPG.player.fighter.hp, RPG.player.fighter.max_hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
