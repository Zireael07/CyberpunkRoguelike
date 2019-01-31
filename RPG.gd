extends Node

# Declare member variables here. Examples:
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func roll(l,h):
	return int(round(rand_range(l,h)))

func roll_dice(n, d):
	var res = 0
	for i in range(n):
		res += int(round(rand_range(1,d)))
		
	return res

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
