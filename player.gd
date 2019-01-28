extends "entity.gd"


signal player_moved(me)
signal player_acted


# Declare member variables here. Examples:
const DIRECTIONS = {
	"N":    Vector2(0,-1),
	"NE":   Vector2(1,-1),
	"E":    Vector2(1,0),
	"SE":   Vector2(1,1),
	"S":    Vector2(0,1),
	"SW":   Vector2(-1,1),
	"W":    Vector2(-1,0),
	"NW":   Vector2(-1,-1),
	}

# Called when the node enters the scene tree for the first time.
func _ready():
#	connect("player_moved", get_parent(), '_on_player_pos_changed')
#	connect("player_acted", get_parent(), '_on_player_acted')
	
	set_z_index(2)


func set_map_position(pos):
	.set_map_position(pos) 
	
	# signal
	emit_signal("player_moved", self)

func update_position(pos, direction):
	var data = .update_position(pos, direction)
	
	# signal
	emit_signal("player_moved", self)
	
	return data

func _input(event):
	direction = Vector2()
	
#	if event is InputEventKey:
#		if event.pressed:
#			print(event.scancode)
	
	if Input.is_action_just_pressed("move_up"):
		direction = DIRECTIONS.N
	if Input.is_action_just_pressed("move_up_right"):
		direction = DIRECTIONS.NE
	if Input.is_action_just_pressed("move_right"):
		direction = DIRECTIONS.E
	if Input.is_action_just_pressed("move_down_right"):
		direction = DIRECTIONS.SE
	if Input.is_action_just_pressed("move_down"):
		direction = DIRECTIONS.S
	if Input.is_action_just_pressed("move_down_left"):
		direction = DIRECTIONS.SW
	if Input.is_action_just_pressed("move_left"):
		direction = DIRECTIONS.W
	if Input.is_action_just_pressed("move_up_left"):
		direction = DIRECTIONS.NW

	if direction != Vector2():
		# makes the move happen!
		var res = update_position(get_position(), direction)
		
		# Check if unblocked
		var blocker = grid.is_cell_blocked(res[1])
		if not blocker:
			set_position(res[0])
			# detect when we bump something
		else:
			if typeof(blocker) == TYPE_OBJECT:
				print("Blocked")
			
		emit_signal("player_acted")
