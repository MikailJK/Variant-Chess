extends StaticBody2D

var Piece

func init(piece):
	Piece = piece

func _on_MoveMarker_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		Piece.global_position = global_position
