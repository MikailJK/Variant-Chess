extends Node

export var XOFFSET = 0
export var YOFFSET = 0

onready var pawn = preload("res://Pieces and Pawns/Pawn.tscn")
onready var rook = preload("res://Pieces and Pawns/Rook.tscn")
onready var knight = preload("res://Pieces and Pawns/knight.tscn")
onready var bishop = preload("res://Pieces and Pawns/bishop.tscn")
onready var king = preload("res://Pieces and Pawns/king.tscn")
onready var queen = preload("res://Pieces and Pawns/Queen.tscn")

const WIDTH = 8
const HEIGHT = 8

var boardString = "rnbqkbnrppppppppoooooooooooooooooooooooooooooooopppppppprnbqkbnr"

export var board = []
var pieces = []

func _ready():
	for i in range(WIDTH):
		board.append([])
		for j in range(HEIGHT):
			board[i].append([])
			board[i][j] = boardString[(i * 8) + j]
			
			var p
			match board[i][j]:
				'p':
					p = pawn.instance()	
					p.init(board, 'p')
				'r':
					p = rook.instance()
					p.init(board, 'r')
				'n':
					p = knight.instance()
					p.init(board, 'n')
				'b':
					p = bishop.instance()
					p.init(board, 'b')
				'k':
					p = king.instance()
					p.init(board, 'k')
				'q':
					p = queen.instance()
					p.init(board, 'q')
				
			if p != null:
				if i * 8 + j > 20:
					p.white = true
				p.global_position = Vector2(16 * j + XOFFSET, 16 * i + YOFFSET)
				add_child(p)
				pieces.append(p)
				
	print(board)
				
			
	




