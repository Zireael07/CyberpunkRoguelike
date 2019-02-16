extends Node

# Declare member variables here. Examples:
var player
var game
var map

# colors for message panel
const COLOR_WHITE = '#ffffff' #deeed6'
const COLOR_RED = '#d04648'
const COLOR_BROWN = '#854c30'
const COLOR_DARK_GREEN = '#346524'
const COLOR_GREEN = '#6daa2c'
const COLOR_YELLOW = '#dad45e'
# from libtcod
const COLOR_LIGHT_BLUE = "#73b9ff" #7373ff"
const COLOR_DARK_GREY = "5f5f5f"   #'#4e4a4e' #muddy gray
const COLOR_LIGHT_GREY = "9f9f9f" #'#8595a1'


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


func broadcast(message, color=COLOR_WHITE):
	if game:
		if game.messagebox:
			game.messagebox.append_bbcode("[color=" +color+ "]" +message+ "[/color]")
			game.messagebox.newline()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
