extends Spatial

var note_scn = preload("res://note.tscn")

var notes_data = [
	{
		"pos": 0, 	# 0
		#"len": 100
	},
	{
		"pos": 400,  # 400*0.005 = 2 units in Godot
		#"len": 100,
	},
	{
		"pos": 800,  # 800*0.005 = 4 units in Godot
		#"len": 100
	},
	{
		"pos": 1200, # 1200*0.005 = 6 units in Godot
		#"len": 100
	}
] 

# bar length - 1600
# bar length in m - 1600 * 0.005 = 8

var note_scale # 0.005

func _ready():
	add_notes()

func add_notes():
	for note_data in notes_data:
		randomize()
		var note = note_scn.instance()
		note.line = (randi() % 3) + 1 # 0 1 2
		note.position = int(note_data.pos)*note_scale
		add_child(note)
