# Import file "033-customize-product"
sketch = Framer.Importer.load("imported/033-customize-product@2x", scale: 1)

Framer.Defaults.Animation =
	time: 0.25
	curve: Bezier.easeInOut

transitionStates =
	start:
		y: sketch.BG.maxX
		opacity: 0
	end:
		y: (sketch.BG.y - 200)
		opacity: 0
		
sketch.transitions.clip = true

sketch.transitions.visible = true
for item in sketch.transitions.children
	item.states = transitionStates
	item.stateSwitch("start")

for photo in sketch.photos.children
	photo.visible = false

# set default hat
sketch.ph_red_blue.visible = true

sketch.Artboard.center()
sketch.Artboard.backgroundColor = "rgba(0,0,0,0)"
Events.wrap(window).addEventListener "resize", (event) ->
    sketch.Artboard.center()

background = new Layer
	width: Screen.width
	height: Screen.height
	gradient: 
		start: "#05F"
		end: "#0DF"

background.sendToBack()
# button interaction
showHat = (name) ->
	for hat in sketch.photos.children
		if hat.name.indexOf(name) != -1
			hat.visible = true
		else
			hat.visible = false

sketch.btn_red_blue.onTap ->
	sketch.tn_red_blue.animate("default").onAnimationEnd ->
		showHat("red_blue")
		sketch.tn_red_blue.animate("end").onAnimationEnd ->
			sketch.tn_red_blue.stateSwitch("start")

sketch.btn_black_green.onTap ->
	sketch.tn_black_green.animate("default").onAnimationEnd ->
		showHat("black_green")
		sketch.tn_black_green.animate("end").onAnimationEnd ->
			sketch.tn_black_green.stateSwitch("start")

sketch.btn_black_only.onTap ->
	sketch.tn_black_only.animate("default").onAnimationEnd ->
		showHat("black_only")
		sketch.tn_black_only.animate("end").onAnimationEnd ->
			sketch.tn_black_only.stateSwitch("start")

sketch.btn_gray_black.onTap ->
	sketch.tn_gray_black.animate("default").onAnimationEnd ->
		showHat("gray_black")
		sketch.tn_gray_black.animate("end").onAnimationEnd ->
			sketch.tn_gray_black.stateSwitch("start")

sketch.btn_red_beige.onTap ->
	sketch.tn_red_beige.animate("default").onAnimationEnd ->
		showHat("red_beige")
		sketch.tn_red_beige.animate("end").onAnimationEnd ->
			sketch.tn_red_beige.stateSwitch("start")
