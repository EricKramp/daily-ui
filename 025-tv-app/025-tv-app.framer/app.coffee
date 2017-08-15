
# Project Info
Framer.Info =
	title: "Daily UI #025 TV App"
	author: "Eric Kramp, UI Designer"
	description: "A prototype for a photo library homescreen."	
	twitter: "drawingnmaking"

	
# Import file "025-tv-app"
sketch = Framer.Importer.load("imported/025-tv-app@2x", scale: 1)
Canvas.backgroundColor = "#60748A"

Framer.Defaults.Animation =
	time: 0.17
	curve: Bezier.easeInOut

tileStates =
	hover:
		shadowColor : "rgba(0, 0, 0, 0.5)"
		shadowBlur : 16
		borderRadius : 8
		scaleX : 1.025

blurLayerStates =
	hover :
		opacity : 0

for tile in sketch.today.children
	tile.states = tileStates
# 	tile.states.hover.x = tile.x + 10
	tile.blurLayer = tile.children[1]
	tile.blurLayer.states = blurLayerStates
	
	tile.onMouseOver ->
		this.animate("hover")
		this.blurLayer.animate("hover")
	
	tile.onMouseOut ->
		this.animate("default")
		this.blurLayer.animate("default")

for item in sketch.bottomRow.children
	item.states = tileStates
	item.blurLayer = item.children[1]
	item.blurLayer.states = blurLayerStates
	
	item.onMouseOver ->
		this.animate("hover")
		this.blurLayer.animate("hover")
	
	item.onMouseOut ->
		this.animate("default")
		this.blurLayer.animate("default")