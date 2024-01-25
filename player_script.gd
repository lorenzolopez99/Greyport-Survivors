extends CharacterBody2D


@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_player : AnimationPlayer = $AnimationPlayer
var spriteArray = ["igor", "arno", "gallant", "weldon"]
var spriteIndex = 0

var speed : int

func initialize(stats):
	speed = stats.dexterity

	
func get_input():
	if (Input.is_action_just_pressed("switch")):
		spriteIndex+=1
		if (spriteIndex >= spriteArray.size()): 
			spriteIndex = 0
		$DefaultSprite.texture = load("res://player_sprites/"+spriteArray[spriteIndex]+".png")
	var face_direction: Vector2 = (get_global_mouse_position() - position).normalized()
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
	print(face_direction)
	if (direction.x == 0 && direction.y == 0):
		animation_player.play('idle')
	else:
		animation_player.play('walk')
	if (face_direction.x < 0):
		$DefaultSprite.flip_h = true
	else:
		$DefaultSprite.flip_h = false
	velocity = direction*speed*15
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	
#func _process(delta):
	#update_animation_parameters()
	#var direction : Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
	#
	#if direction:
		#velocity = direction*speed*15
		#print(velocity)
	#else:
		#velocity = Vector2.ZERO
	#
	#if Input.is_action_pressed("left"):
		#$DefaultSprite.flip_h = true
	#elif Input.is_action_pressed("right"):
		#$DefaultSprite.flip_h = false
		#
	#if Input.is_action_just_pressed("switch"):
		#spriteIndex+=1
		#if spriteIndex >= spriteArray.size(): spriteIndex = 0
		#$DefaultSprite.texture = load("res://player_sprites/"+spriteArray[spriteIndex]+".png")
	#move_and_slide()
 #
#func update_animation_parameters():
	#if (velocity == Vector2.ZERO):
		#animation_tree["parameters/conditions/is_idle"] = true
		#animation_tree["parameters/conditions/is_moving"] = false
	#else:
		#animation_tree["parameters/conditions/is_moving"] = true
		#animation_tree["parameters/conditions/is_idle"] = false
