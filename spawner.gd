extends Node2D

@export var obj : PackedScene
@export var interval: int
@export var spawnChance: float
@onready var spawnPoint: Marker2D = $spawnDir
var canSpawn = true
var rng = RandomNumberGenerator.new()
var rand = rng.randf_range(0, 100)

func _ready():
	$spawnTime.start(interval)
	
func _physics_process(delta):
	if rand < spawnChance and canSpawn:
		spawn();
		canSpawn = false;
		
func _on_spawn_time_timeout():
	rand = rng.randf_range(0, 100)
	canSpawn = true;
	
	
	
func spawn():
	var inst = obj.instantiate();
	owner.add_child(inst)
	inst.transform = spawnPoint.global_transform
