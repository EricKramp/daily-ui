font = Utils.loadWebFont("Alegreya Sans")
Framer.Defaults.Animation =
	time: 0.2
	curve: Bezier.easeOut

items = [item, item_1, item_2, item_3, notch]

# show/hide/start states
item.states=
	start:
		opacity: 0
		y: -10
		scaleY: 0
	show:
		opacity: 1
		y: 0
		scaleY: 1
		options:
			delay: 0
	hide:
		opacity: 0
		y: -10
		scaleY: 0
		options:
			delay: 0.3

item_1.states=
	start:
		opacity: 0
		y: 40
		scaleY: 0
	show:
		opacity: 1
		y: 50
		scaleY: 1
		options:
			delay: 0.1
	hide:
		opacity: 0
		y: 40
		scaleY: 0
		options:
			delay: 0.2

item_2.states=
	start:
		opacity: 0
		y: 90
		scaleY: 0
	show:
		opacity: 1
		y: 100
		scaleY: 1
		options:
			delay: 0.2
	hide:
		opacity: 0
		scaleY: 0
		y: 90
		options:
			delay: 0.1

item_3.states=
	start:
		opacity: 0
		scaleY: 0
		y: 140
	show:
		opacity: 1
		y: 150
		scaleY: 1.00
		options:
			delay: 0.3
	hide:
		opacity: 0
		y: 140
		scaleY: 0
		options:
			delay: 0

notch.states =
	start:
		rotationZ: 0
		originY: 0.50
	show:
		rotationZ: 180
		originY: 0.50
	hide:
		rotationZ: 0
		originY: 0.50

for i in items
	i.stateSwitch("start")
	i.originY = 0
	i.onStateSwitchEnd ->
		if this.states.current.name is "hide"
			this.stateSwitch("start")

# toggle button states
toggle.states=
	normal:
		scale: 1
	hover:
		scale: 1.05
	press:
		scale: 0.98

toggle.onMouseOver ->
	this.animate("hover")
toggle.onMouseOut ->
	this.animate("normal")
toggle.onMouseDown ->
	this.animate("press")
toggle.onMouseUp ->
	toggle.animate("normal")
	

toggle.onTap ->
	for i in items
		i.stateCycle("show", "hide")