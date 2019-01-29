extends Node

onready var ownr = get_parent()

func _ready():
	ownr.ai = self
	
func take_turn():
	if ownr.dead:
		print("Dead, do nothing")
		return
	
	var target = RPG.player
	var distance = ownr.distance_to(target.get_map_position())
	print("AI taking turn")
	if distance <= 5:
		print("Player in torch radius")
		if distance <= 1:
			print("AI attacking")
		else:
			print("AI making a move to " + str(target.get_map_position()))
			ownr.step_to(target.get_map_position())
