extends PanelContainer

# Declare member variables here. Examples:

onready var hplabel = get_node("VBoxContainer/HPBox/HP")
onready var hpbar = get_node("VBoxContainer/HPBox/ProgressBar")

onready var coords = get_node("VBoxContainer/VBoxContainer/Coords")
onready var npclabel = get_node("VBoxContainer/VBoxContainer/NPCLabel")
onready var hplabel_npc = get_node("VBoxContainer/VBoxContainer/HPBoxNPC/HP")
onready var hpbar_npc = get_node("VBoxContainer/VBoxContainer/HPBoxNPC/ProgressBar")

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
	
func _on_Node2D_cell_hover(cell, map):
	coords.set_text(str(cell))
	var entities_text = map.get_entities_in_cell_readable(cell)
	
	npclabel.set_text(str(entities_text))
	
	var entities = map.get_entities_in_cell(cell)
	# if we have an entity that is an actor, display hp
	if entities.size() > 0 and entities[0].fighter != null:
		$"VBoxContainer/VBoxContainer/HPBoxNPC".show()
		hplabel_npc.set_text("HP: " + str(entities[0].fighter.hp) + " / "+str(entities[0].fighter.max_hp))
		hpbar_npc.set_max(entities[0].fighter.max_hp)
		hpbar_npc.set_value(entities[0].fighter.hp)
	else:
		$"VBoxContainer/VBoxContainer/HPBoxNPC".hide()