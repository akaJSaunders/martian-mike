extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500

	var direction = 0
	if active == true:
		direction = Input.get_axis('move_left', "move_right")
		handle_movement(direction)
	
		update_animations(direction)
		move_and_slide()
	
func handle_movement(direction):
	if Input.is_action_just_pressed('jump'): #&& is_on_floor():
		jump(jump_force)
	velocity.x = direction * speed
	
func update_animations(direction):
	if is_on_floor():
		if direction != 0:
			animated_sprite.flip_h = (direction == -1)
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		if velocity.y < 0:
			animated_sprite.play('jump')
		else:
			animated_sprite.play("fall")

func jump(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force
