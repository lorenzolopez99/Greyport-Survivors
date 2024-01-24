extends Node

class_name CharacterStats

var speed : int

func initialize(stats: CharacterClass):
	speed = stats.dexterity
