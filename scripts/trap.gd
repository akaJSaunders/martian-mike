extends Node2D

signal touched_payer

func _on_area_2d_body_entered(body):
	if body is Player:
		touched_payer.emit()
