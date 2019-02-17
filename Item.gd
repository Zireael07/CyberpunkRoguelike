extends Node

# class member variables go here, for example:
onready var ownr = get_parent()

export(String) var use_function = ''
export(bool) var indestructible
# equipment
export(bool) var equippable
var equipped = false
export(String) var equip_slot = ''


export(PoolIntArray) var damage = []

var inventory_slot

func pickup(entity):
	# fix
	ownr.set_visible(false)
	ownr.set_map_position(entity.get_map_position())
	
	
	RPG.broadcast(entity.get_name() + " picks up " + ownr.get_name())
	entity.container.add_to_inventory(ownr)

#	if entity == RPG.player:
#		RPG.inventory.add_to_inventory(ownr)

func drop(entity):
	RPG.broadcast(entity.get_name() + " drops " + ownr.get_name())
	
	# fix
	ownr.set_visible(true)
	ownr.set_map_position(entity.get_map_position())
	
	entity.container.remove_from_inventory(ownr)
	
#	if entity == RPG.player:
#		assert inventory_slot != null
#		RPG.inventory.remove_from_inventory(inventory_slot,ownr)


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	ownr.item = self