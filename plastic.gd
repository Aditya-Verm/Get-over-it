extends Area2D

func _ready() -> void:
	# Automatically add this bottle to a group called "bottles"
	add_to_group("bottles")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("add_bottle"):
		body.add_bottle() # Adds to your score
		
		# Check how many bottles are left (minus 1 for this one about to be freed)
		var remaining_bottles = get_tree().get_nodes_in_group("bottles").size() - 1
		
		if remaining_bottles <= 0:
			print("GAME OVER! You collected all the bottles!")
			# Later, you can load a win screen or restart the level here!
		
		queue_free() # Deletes the bottle
