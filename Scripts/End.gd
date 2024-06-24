extends Area2D

func _on_body_entered(body):
	if body.name =="RigidBody2D":
		Global.goto_scene("res://Scenes/Game2.tscn")
		
