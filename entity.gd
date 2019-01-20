extends Node2D

# Declare member variables here. Examples:
var direction = Vector2()

var target_pos = Vector2()
export var block_move = false

var grid
var tile_size = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	grid = get_tree().get_nodes_in_group("map")[0]
	tile_size = grid.get_cell_size()
	#pass # Replace with function body.

func get_map_position():
	var grid_pos = grid.world_to_map(get_position())
	
	return grid_pos

func set_map_position(pos):
	var new_grid_pos = pos #grid.map_to_world(pos)
	var target_pos = grid.map_to_world(pos)
	
	# Print statements help to understand what's happening. We're using GDscript's string format operator % to convert
	# Vector2s to strings and integrate them to a sentence. The syntax is "... %s" % value / "... %s ... %s" % [value_1, value_2]
	print("Pos %s, dir %s" % [pos, direction])
	print("Grid pos new: %s" % [new_grid_pos])
	#print(target_pos)
	
	set_position(target_pos+Vector2(0,-8))

	return [target_pos, new_grid_pos]
	
func update_position(pos, direction):
	var grid_pos = grid.world_to_map(pos)

	var new_grid_pos = grid_pos + direction

	var target_pos = grid.map_to_world(new_grid_pos)
	
	# Print statements help to understand what's happening. We're using GDscript's string format operator % to convert
	# Vector2s to strings and integrate them to a sentence. The syntax is "... %s" % value / "... %s ... %s" % [value_1, value_2]
	#print("Pos %s, dir %s" % [pos, direction])
	#print("Grid pos, old: %s, new: %s" % [grid_pos, new_grid_pos])
	#print(target_pos)
	
	return [target_pos, new_grid_pos]
