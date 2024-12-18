extends CharacterBody3D

@export_category("Variables")
@export var speed := 600

@onready var camera = %Camera

# In-game vars
@onready var score := 0
@onready var ammo  := 5
@onready var health  := 100


var bullet = preload("res://Projectile/bullet.tscn")

func _ready() -> void:
	add_to_group("player")


var target_pos = Vector3()
var moving_to_target = false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		var ray_result = camera.shoot_ray()
		if ray_result.has("position"):
			target_pos = ray_result["position"]
			target_pos.y = 1       
			moving_to_target = true
		else: print("CLICK ON THE PLAYING AREA PLS")

func _physics_process(delta: float) -> void:

	if health <= 0:
		print("ded")
		
	move_logic(target_pos,delta)
	shoot(position)
	
	move_and_slide()


func move_logic(target,delta):
	if moving_to_target:
		var direct = (target-position).normalized() #direction... 
		var dist = position.distance_to(target)		#distance... 
																
		if dist > 1 :
			velocity = direct *speed *delta *dist #distance helps so that the further the target more speed.. I found that satisfiting
		else:
			velocity = Vector3.ZERO
			moving_to_target = false


func shoot(pos):
	if Input.is_action_just_pressed("right_click") and ammo >0:
		ammo = max(0,ammo -1)
		var instance = bullet.instantiate()
		instance.camera = camera
		instance.player = %player
		instance.position = pos
		instance.pos = pos
		instance.add_to_group("bullet")
		get_tree().root.get_child(0).add_child(instance)
		instance.fire()


func _on_body_entered(body:Node3D) -> void:
	if body.is_in_group("enemy"):
		health -= 10