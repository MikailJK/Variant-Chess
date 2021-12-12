extends StaticBody2D

export(bool) var white = false

var dots = []

onready var lastPostion = global_position
onready var dot = preload("res://Pieces and Pawns/MoveMarker.tscn")
onready var sprite = $Sprite
onready var board = get_parent().board

func _ready():
	if white:
		sprite.frame += 6
	print(board)

func _process(delta):
	if lastPostion != global_position:
		lastPostion = global_position
		for i in dots.size():
			var d = dots.pop_back()
			d.queue_free()

func _on_Queen_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			dots.append(dot.instance())
			dots[0].init(self)
			dots.append(dot.instance())
			dots[1].init(self)
			add_child(dots[0])
			add_child(dots[1])
			if white:
				dots[0].global_position = global_position + Vector2(0, -16)
				dots[1].global_position = global_position  + Vector2(0, -32)
			else:
				dots[0].global_position = global_position + Vector2(0, 16)
				dots[1].global_position = global_position  + Vector2(0, 32)
