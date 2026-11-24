extends Area2D
func _ready() -> void:
	add_to_group("bottles")
	body_entered.connect(_on_body_entered)
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("add_bottle"):
		body.add_bottle()
	var remaining_bottles = get_tree().get_nodes_in_group("bottles").size() - 1
		# z bottle goes by by
	if remaining_bottles <= 0:
		print("GAME OVER! You collected all the bottles!")
			# did not have time to add anything else
		queue_free() 
