extends "res://note/base_note.gd"

func _on_process(delta):
	._on_process(delta)
	
	if not collected:
		if is_colliding and picker:
			if picker.is_collecting:
				collect()

