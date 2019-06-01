extends Spatial

var bar_scn = preload("res://bar.tscn")
var bars = []
onready var bars_node = $BarsNode

var bar_length_in_m
var curr_location
var speed
var note_scale

func setup(game):
	speed = Vector3(0,0,game.speed)
	bar_length_in_m = game.bar_length_in_m
	curr_location = Vector3(0,0,-bar_length_in_m)
	note_scale = game.note_scale
	add_bars()
	
		
func _process(delta):
	bars_node.translate(speed*delta)
	
	for bar in bars:
		if bar.translation.z + bars_node.translation.z >= bar_length_in_m:
			remove_bar(bar)
			add_bar()
		

func add_bar():
	var bar = bar_scn.instance()
	bar.translation = Vector3(curr_location.x, curr_location.y, curr_location.z)
	bar.note_scale = note_scale
	bars.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector3(0,0,-bar_length_in_m)
	
func remove_bar(bar):
	bar.queue_free()
	bars.erase(bar)
	
func add_bars():
	for i in range(4):
		add_bar()
	
