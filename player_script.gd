extends CharacterBody2D
#test commit
@onready var animation_tree : AnimationTree = $AnimationTree
var spriteArray = ["igor", "arno", "gallant", "weldon"]
var spriteIndex = 0

func _ready():
	animation_tree.active = true
	
func _process(delta):
	update_animation_parameters()
	velocity = Vector2.ZERO
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
	
	if direction:
		velocity = direction*250
	else:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		$DefaultSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		$DefaultSprite.flip_h = false
		
	if Input.is_action_just_pressed("switch"):
		spriteIndex+=1
		if spriteIndex >= spriteArray.size(): spriteIndex = 0
		$DefaultSprite.texture = load("res://player_sprites/"+spriteArray[spriteIndex]+".png")
	move_and_slide()
 
func update_animation_parameters():
	if (velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/is_moving"] = true
		animation_tree["parameters/conditions/is_idle"] = false
