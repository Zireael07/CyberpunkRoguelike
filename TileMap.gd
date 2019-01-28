extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_entities_in_cell(cell):
	var list = []
	for obj in get_tree().get_nodes_in_group('entity'):
		if obj.get_map_position() == cell:
			list.append(obj)
	return list

# Return TRUE if cell is a floor on the map
func is_walkable( cell ):
	var walk = [0,1,3]
	return walk.has(get_cellv( cell ))
	
# Return False if cell is an unblocked floor
# Return Object if cell has a blocking Object
func is_cell_blocked(cell):
	var blocks = not is_walkable(cell)
	var entities = get_entities_in_cell(cell)
	for e in entities:
		if e.block_move:
			blocks = e

	return blocks