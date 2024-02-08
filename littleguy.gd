extends CharacterBody2D

@export var speed: float = 100
@export var accel: float = 10

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var currentAnim = "idle"
var angle = 0
var alive = true

func _physics_process(delta):
	if alive:
		currentAnim = "idle"
		var input_dir = Input.get_vector("left", "right", "up", "down")
		if input_dir.length() != 0:
			angle = input_dir.angle() / (PI/4)
			angle = wrapi(int(angle), 0, 8)
			currentAnim = "walk"
		velocity.x = move_toward(velocity.x, speed * input_dir.x, accel)
		velocity.y = move_toward(velocity.y, speed * input_dir.y, accel)
		move_and_slide()
		anim.play(currentAnim + str(angle))


func _on_fallspace_body_entered(body):
	for group in body.get_groups():
		if group == "man":
			anim.play("death")
			alive = false;
			$"../vineboom".play()
			$"../AudioStreamPlayer".stop()
			print("booboo")
			
	
