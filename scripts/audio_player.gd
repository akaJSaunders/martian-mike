extends Node

var hurt = preload("res://assets/audio/hurt.wav")
var jump = preload("res://assets/audio/jump.wav")

func play_sfx(sfx_name: String):	
	var stream = null
	if sfx_name == "hurt":
		stream = hurt
	elif sfx_name == "jump":
		stream = jump
	else:
		print("Invalid SFX name")
		return
		
	var audioStreamPlayer = AudioStreamPlayer.new()
	audioStreamPlayer.stream = stream
	audioStreamPlayer.name = "SFX"
	
	add_child(audioStreamPlayer)
	audioStreamPlayer.play()
	await audioStreamPlayer.finished
	audioStreamPlayer.queue_free()
