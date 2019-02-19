extends Node

# class member variables go here, for example:
onready var ownr = get_parent()

export(String) var use_function = ''
export(bool) var indestructible
# equipment
export(bool) var equippable
var equipped = false
export(String) var equip_slot = ''


export(PoolIntArray) var damage = [1,6]

var inventory_slot

func use(entity):
	print("Using an item")
	
	if equippable:
#		print("Equippable")
		if not equipped:
			# check for equipped
			if entity.container.get_equipped_in_slot(equip_slot) == null:
				RPG.broadcast(entity.get_name() + " equipped " + ownr.name, RPG.COLOR_WHITE)
				equipped = true
			
				if entity == RPG.player:
					# GUI fix
					RPG.inventory.move_to_equipped(inventory_slot, equip_slot, ownr)
				
				if equip_slot == "MAIN_HAND" and damage.size() > 0:
					#print("Using the sword's damage")
					# use the weapon's damage in place of the player's
					entity.fighter.damage = damage
					return
				else:
					# prevent falling through
					return
			else:
				print("Already wearing item in slot " + str(equip_slot) + "!")
				# prevent falling through
				return
	if use_function.empty():
		RPG.broadcast("The " +ownr.name+ " cannot be used", RPG.COLOR_DARK_GREY)
		return
	if has_method(use_function):
		print("We have the function: " + str(use_function))
		var result = call(use_function, entity)
		if result != "OK":
			RPG.broadcast(result,RPG.COLOR_DARK_GREY)
			return
		if not indestructible:
			# fix
			entity.container.remove_from_inventory(ownr)
			if entity == RPG.player:
				RPG.inventory.remove_from_inventory(inventory_slot, ownr)
			ownr.remove()


func pickup(entity):
	# fix
	ownr.set_visible(false)
	ownr.set_map_position(entity.get_map_position())
	
	
	RPG.broadcast(entity.get_name() + " picks up " + ownr.get_name())
	entity.container.add_to_inventory(ownr)

	if entity == RPG.player:
		RPG.inventory.add_to_inventory(ownr)

func drop(entity):
	RPG.broadcast(entity.get_name() + " drops " + ownr.get_name())
	
	# fix
	ownr.set_visible(true)
	ownr.set_map_position(entity.get_map_position())
	
	entity.container.remove_from_inventory(ownr)
	
	if entity == RPG.player:
#		assert inventory_slot != null
		RPG.inventory.remove_from_inventory(inventory_slot,ownr)


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	ownr.item = self