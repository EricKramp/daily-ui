# setup play button drag behavior
btn_play_pause.draggable = true
btn_play_pause.animationOptions =
	curve: Spring(damping: 0.5)
	time: 0.5

icon_pause.visible = false

txt_track_time.states.large =
	scale: 1.5
txt_track_time.animationOptions = 
	time: 0.1

# btn_play_pause.onTap ->
# 	icon_play.visible = !icon_play.visible
# 	icon_pause.visible = !icon_pause.visible

btn_play_pause.onDrag ->
	txt_track_time.animate("large")
	if (btn_play_pause.draggable.direction == "up")
		if (track_progress.rotationZ < 166)
			track_progress.rotationZ += 1
	else
		if (track_progress.rotationZ > 0)
			track_progress.rotationZ -= 1

btn_play_pause.onDragEnd ->
	txt_track_time.animate("default")
	btn_play_pause.animate("default")