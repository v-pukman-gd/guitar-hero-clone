extends Spatial

var note_scn = preload("res://note.tscn")

var note_scale
var bar_data 

func _ready():
	add_notes()

func add_notes():
	var line = 1
	for line_data in bar_data:
		var notes_data = line_data.notes
		for note_data in notes_data:
			var note = note_scn.instance()
			note.line = line # 1 2 3
			note.position = int(note_data.pos)*note_scale
			add_child(note)
		line += 1 
