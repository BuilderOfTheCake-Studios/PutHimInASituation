extends CharacterBody2D

@export var speed: float = 1

func _physics_process(delta):
	position += transform.x * speed
			

