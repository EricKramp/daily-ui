# some defaults
Framer.Defaults.Animation =
	time: 0.5
	curve: Spring(damping: 0.5)

# setup button states
btn_play.states =
	hover: 
		borderColor: "rgba(34, 170, 153, 0.5)"
		backgroundColor: "rgba(34, 170, 153, 0.5)"
		animationOptions:
			time: 0.1
			curve: Bezier.ease
	press:
		backgroundColor: "rgba(34, 170, 153, 1)"
		borderColor: "rgba(34, 170, 153, 1)"
		animationOptions:
			time: 0.1
			curve: Bezier.ease

icon_play.states =
	hover:
		fill: "rgb(255, 255, 255)"
		animationOptions:
			time: 0.1
			curve: Bezier.ease

# btn_play.onMouseOver ->
# 	btn_play.animate("hover")
# 	icon_play.animate("hover")
# 
# btn_play.onMouseDown ->
# 	btn_play.animate("press")
# 	icon_play.animate("hover")
# 
# btn_play.onMouseOut ->
# 	icon_play.animate("default")	
# 	btn_play.animate("default")

# slider behavior
slider.animate("default")
slider.draggable = true
slider.draggable.vertical = false
slider.onDragEnd ->
	slider.animate("default")

# Setting Time
sliderChunks = sliderChunks = slider.x / parseInt(slider_value.text)
sliderStart = slider.x
time = parseInt(slider_value.text)

slider.onDragStart ->
	

slider.onDrag ->
	if ((slider.x % sliderChunks) < 1)
		if (slider.x < sliderStart)
			time--
		else
			time++
		
		if (time < 0)
			time = 0
			
		slider_value.text = time

# panel transitions
panelOpt = 
	time: 1.25
	curve: Bezier.easeInOut

panel_start.states =
	show:
		size: panel_start.size
		backgroundColor: panel_start.backgroundColor
		animationOptions: panelOpt
	collapse:
		size: panel_end.size
		backgroundColor: panel_end.backgroundColor
		animationOptions: panelOpt

photo.states = 
	show:
		y: photo.y
		animationOptions: panelOpt
	collapse:
		y: photo_end.y
		animationOptions: panelOpt

slider_grp.states =
	show: 
		opacity: 1
		animationOptions: panelOpt
	collapse:
		opacity: 0
		animationOptions: panelOpt

slider_grp.onStateSwitchEnd ->
	if (slider_grp.states.current == "collapse")
		slider_grp.visible = false
	else
		slider_grp.visible = true

progress_label.parent = setup
progress_label.states = 
	show:
		opacity: 1
		scale: 1
		y: 535
		animationOptions: panelOpt
	hide:
		opacity: 0
		scale: 0.90
		y: 545
		animationOptions: panelOpt
progress_label.stateSwitch("hide")
		
btn_pause.parent = panel_start
btn_pause.states =
	show: 
		opacity: 1
		y: -72
		scale: 1
		animationOptions: panelOpt
	hide:
		opacity: 0
		y: -102
		scale: 0.9
		animationOptions: panelOpt
btn_pause.stateSwitch("hide")
		
txt_breathe.parent = setup
txt_breathe.states =
	show: 
		opacity: 1
		y: 500
		animationOptions: panelOpt
	hide:
		opacity: 0
		y: 510
		animationOptions: panelOpt
txt_breathe.stateSwitch("hide")
	

# page transition
btn_play.onClick ->
	panel_start.animate("collapse")
	photo.animate("collapse")
	slider_grp.animate("collapse")
	Utils.delay panelOpt.time, ->
		progress_label.animate("show")
		Utils.delay panelOpt.time, ->
			btn_pause.animate("show")
			txt_breathe.animate("show")
			
btn_pause.onClick ->
	progress_label.animate("hide")
	btn_pause.animate("hide")
	txt_breathe.animate("hide")
	Utils.delay panelOpt.time, ->
		panel_start.animate("show")
		photo.animate("show")
		slider_grp.animate("show")
