extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

func animate():
	animated_sprite.play("pressed")
