# Import file "009-music-player"
sketch = Framer.Importer.load("imported/009-music-player@2x", scale: 1)
btn_play_pause = sketch.btn_play_pause
txt_track_time = sketch.track_time
track_progress = sketch.track_group

# setup play button drag behavior
btn_play_pause.animate("default")
btn_play_pause.draggable = true
btn_play_pause.animationOptions =
	curve: Spring(damping: 0.5)
	time: 0.5

txt_track_time.originX = 1
txt_track_time.states.large =
	scale: 1.5
txt_track_time.animationOptions = 
	time: 0.1

btn_play_pause.onDrag ->
	txt_track_time.animate("large")
	if (btn_play_pause.draggable.direction == "up")
		if (track_progress.rotationZ < 176)
			track_progress.rotationZ += 1
	else
		if (track_progress.rotationZ > 0)
			track_progress.rotationZ -= 1

btn_play_pause.onDragEnd ->
	txt_track_time.animate("default")
	btn_play_pause.animate("default")