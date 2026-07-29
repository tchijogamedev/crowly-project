extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	var direction = Input.get_axis("left", "right")
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0
	
	if input_vector != Vector2.ZERO:
		$AnimatedSprite2D.play("crowlywalk")
	else:
		$AnimatedSprite2D.play("crowlyidle")
		
	velocity = input_vector.normalized() * 450
	
	move_and_slide()
