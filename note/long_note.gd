extends "res://note/base_note.gd"

var curr_length_in_m

var hold_started = false
var hold_canceled = false

var captured = false

func _on_ready():
	._on_ready()
	curr_length_in_m = max(100, length - 100)*length_scale
	$Beam.scale = Vector3(1,1,curr_length_in_m)
	$Beam.set_material(line)
	
func _on_process(delta):
	._on_process(delta)
	
	if not collected:
		if is_colliding and picker and not hold_canceled:
			if picker.is_collecting:
				hold_started = true # start hold the note
			elif hold_started:
				hold_canceled = true  # drop the note
		
		if hold_started and not hold_canceled:
			if not captured:
				var diff = picker.global_transform.origin.z - self.global_transform.origin.z
				if abs(diff) <= 0.1:
					captured = true
					translate(Vector3(0,0,diff))
			else:			
				curr_length_in_m -= speed.z * delta
				if curr_length_in_m <= 0:
					collect()
				else:
					$Beam.scale = Vector3(1,1,curr_length_in_m)
					translate(-speed*delta)
			