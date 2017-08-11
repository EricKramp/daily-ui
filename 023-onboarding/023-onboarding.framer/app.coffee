# Import file "023-onboarding"
sketch = Framer.Importer.load("imported/023-onboarding@2x", scale: 1)

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	scrollHorizontal: false
	clip: false

pageScroller.animationOptions =
	time: 0.5
	curve: Spring(damping: 0.75)

pageScroller.addPage(sketch.screen1, "bottom")
pageScroller.addPage(sketch.screen2, "bottom")
pageScroller.addPage(sketch.screen3, "bottom")

sketch.btn_next.onClick ->
	pageScroller.snapToNextPage("bottom", true)
	
sketch.btn_yes.onClick ->
	pageScroller.snapToNextPage("bottom", true)

for q in sketch.Questions.children
	q.children[0].states =
		off:
			opacity: 0
			scale: 1.5
		on:
			opacity: 1
			scale: 1
	
	q.children[0].animationOptions =
		time: 0.25
		curve: Spring(damping: 0.5)
	
	q.children[0].stateSwitch("off")
	
	q.onClick ->
		this.children[0].stateCycle("on", "off")

