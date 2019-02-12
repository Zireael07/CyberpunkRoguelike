extends Node2D

# class member variables go here, for example:
var map_hovered = false
var cell_hovered = null setget _set_cell_hovered

signal cell_hover

var map

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	map = get_node("map/TileMap")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Viewport_gui_input(event):
	# place the cursor
	if event is InputEventMouseMotion:
		if !self.map_hovered:
			self.map_hovered = true
#			$"TileMap/Cursor".visible = true
		# we need to use local due to tilemap scaling
		# also need to round
		var til = Vector2(int(round(map.get_local_mouse_position().x)), int(round(map.get_local_mouse_position().y)))
		#print("mouse " + str(map.get_local_mouse_position()))
#		print("mouse: " + str(til))
		var map_cell = map.world_to_map(til)
		if map_cell != self.cell_hovered:
			self.cell_hovered = map_cell
			
		emit_signal("cell_hover", map_cell, map)
	
	# test
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Pressed left button")
			if cell_hovered:
				print("Moving to " + str(cell_hovered))
				RPG.player.step_to(cell_hovered)
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			print("Pressed right button")


func _on_Viewport_mouse_exited():
	self.map_hovered = false
#	$"TileMap/Cursor".visible = false
	self.cell_hovered = null

func _set_cell_hovered( what ):
	cell_hovered = what
#	if cell_hovered:
#		$"TileMap/Cursor".position = map.map_to_world( cell_hovered )