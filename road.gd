extends Spatial

var bar_scn = preload("res://bar.tscn")
var bars = []
onready var bars_node = $BarsNode
var bar_length_in_m = 8
var curr_location = Vector3(0,0,-bar_length_in_m)
var speed = Vector3(0,0,2)

func _ready():
	for i in range(4):
		add_bar()
		
		
func _process(delta):
	bars_node.translate(speed*delta)
	
	for bar in bars:
		if bar.translation.z + bars_node.translation.z >= bar_length_in_m:
			remove_bar(bar)
			add_bar()
		

func add_bar():
	var bar = bar_scn.instance()
	bar.translation = Vector3(curr_location.x, curr_location.y, curr_location.z)
	bars.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector3(0,0,-bar_length_in_m)
	
func remove_bar(bar):
	bar.queue_free()
	bars.erase(bar)
	
