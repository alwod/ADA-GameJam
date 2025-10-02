extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.coins += 1
		print(GameManager.coins)
		queue_free()
	
	
	
