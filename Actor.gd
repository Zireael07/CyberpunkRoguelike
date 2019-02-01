extends Node

# Declare member variables here. Examples:
onready var ownr = get_parent()
signal hp_changed(current,full)

export(int) var max_hp = 10 setget _set_max_hp
var hp = 10 setget _set_hp

# Called when the node enters the scene tree for the first time.
func _ready():
	ownr.fighter = self
	fill_hp()


func fill_hp():
	self.hp = self.max_hp
	
func take_damage(from, amount: int):
	#print(get_parent().get_name() + " takes " + str(amount) + " damage!")
	broadcast_damage_taken(from,amount)
	self.hp -= amount

func die():
	get_parent().kill()

func _set_hp(value: int):
	hp = value
	emit_signal('hp_changed', hp, self.max_hp)
	if hp <= 0:
		die()

func _set_max_hp(what: int):
	max_hp = what
	emit_signal('hp_changed', self.hp, self.max_hp)

func broadcast_damage_taken(from, amount: int):
	var n = from.name
	var m = str(amount)
	var color = RPG.COLOR_DARK_GREY
	if ownr == RPG.player:
		color = RPG.COLOR_RED
	RPG.broadcast(n+ " hits " +ownr.name+ " for " +str(amount)+ " HP",color)



func fight(who):
	# paranoia
	if not who.fighter:
		return
		
	RPG.broadcast(ownr.name + " hits " + who.name + "!", RPG.COLOR_LIGHT_BLUE)
	who.fighter.take_damage(ownr, RPG.roll(1,4))	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
