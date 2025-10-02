extends Area2D


func _on_body_entered(body: Node2D) -> void:
	GameManager.coins += 1
	print(GameManager.coins)
	queue_free()
	
	
