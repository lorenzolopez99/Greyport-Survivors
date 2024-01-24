extends Node

class_name Character

@onready var stats = $Stats
@onready var player = $Player
#onready var skills = skills TODO

@export var character : Resource


# Called when the node enters the scene tree for the first time.
func _ready():
	player.initialize(character)
	pass
