extends Spatial

onready var music_node = $Music
onready var road_node = $Road

var audio
var audio_file = "res://audio.ogg"
var audio_file2 = "res://audio2.ogg"

var tempo
var bar_length_in_m
var quarter_time_in_sec
var speed
var note_scale
var start_pos_in_sec

func _ready():
	audio = load(audio_file2)
	calc_params()
	
	music_node.setup(self)
	road_node.setup(self)
	
func calc_params():
	tempo = 104
	bar_length_in_m = 8 # Godot meters
	quarter_time_in_sec = 60/float(tempo) # 60/60 = 1, 60/85 = 0.71
	speed = bar_length_in_m/float(4*quarter_time_in_sec) # each bar has 4 quarters # 
	note_scale = bar_length_in_m/float(4*400)
	start_pos_in_sec = 0
	

