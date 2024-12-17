
extends CharacterBody3D


@onready var player

@export var speed = 400


func _ready():
	add_to_group("enemy")

func _process(_delta):
	var direction_to_player = global_transform.origin.direction_to(player.global_transform.origin)
	var target_basis = Basis.looking_at(direction_to_player, Vector3.UP)
	transform.basis = transform.basis.slerp(target_basis, 0.1)  # Adjust 0.1 for rotation speed


func _physics_process(delta: float) -> void:
	var target_pos = player.position
	target_pos.y = 0.5

	move_ai(target_pos,delta)	
	move_and_slide()


func move_ai(target,delta):      
	var direct = (target-position).normalized() #direction... 
	var dist = position.distance_to(target)		#distance...

	if dist > 1 :
		velocity = direct *speed *delta 
	else:
		velocity = Vector3.ZERO

func death():
	# get_node("../../particle_controller").explode_particle(position)

	player.score += 100
	queue_free()

	get_parent().dead_enemies = get_parent().dead_enemies + 1 


