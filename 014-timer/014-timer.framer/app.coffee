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

slider_knob.onMouseOver ->
	slider_knob.animate
		shadowBlur: 5
		
slider_knob.onMouseOut ->
	slider_knob.animate
		shadowBlur: 0

# Create slider
slider = new SliderComponent
	parent: panel_start
	width: panel_start.width
	min: 0
	max: 20
	value: 10
	knobSize: 44
	backgroundColor: "rgba(0,0,0,0)"
slider.fill.backgroundColor = "rgba(0,0,0,0)"

slider_knob.parent = slider.knob
slider_knob.center()

# Listen for slider value updates
slider.onValueChange ->
	newTime = Math.round(slider.value)
	slider_value.text = newTime
	countdown.text = newTime + ":00"


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

slider.states =
	show: 
		opacity: 1
		animationOptions: panelOpt
	collapse:
		opacity: 0
		animationOptions: panelOpt

slider.onStateSwitchEnd ->
	if (slider.states.current == "collapse")
		slider.visible = false
	else
		slider.visible = true

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
	setTimer()
	panel_start.animate("collapse")
	photo.animate("collapse")
	slider.animate("collapse")
	Utils.delay panelOpt.time, ->
		progress_label.animate("show")
		Utils.delay panelOpt.time, ->
			btn_pause.animate("show")
			txt_breathe.animate("show")
			startTimer()
			
btn_pause.onClick ->
	stopTimer()
	progress_label.animate("hide")
	btn_pause.animate("hide")
	txt_breathe.animate("hide")
	Utils.delay panelOpt.time, ->
		panel_start.animate("show")
		photo.animate("show")
		slider.animate("show")

# countdown
timerInterval = null
currentTime = 0

setTimer = () ->
	currentTime = Math.round(slider.value) * 60
	countdown.text = timeFormatter(currentTime)

startTimer = () ->
	timerInterval = Utils.interval 1, ->
		updateCountDown()

stopTimer = () ->
	clearInterval(timerInterval)

updateCountDown = () ->
	currentTime--
	countdown.text = timeFormatter(currentTime)

timeFormatter = (seconds) ->
	minutes = Math.floor(seconds / 60)
	seconds = Math.round(seconds % 60)
	if seconds < 10 then seconds = "0#{seconds}"
	return "#{minutes}:#{seconds}"
