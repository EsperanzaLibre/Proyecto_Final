extends ParallaxLayer
onready var cloud_speed = -40


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	self.motion_offset.x += cloud_speed * delta
