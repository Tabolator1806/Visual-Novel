extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func showSprites(sprites):
	for node in get_children():
		node.queue_free()
	for sprite in sprites:
		var textureRect = preload("res://scenes/character_sprite.tscn").instantiate()
		textureRect.texture = load("res://assets/sprites/"+sprite["File"])
		textureRect.size.x = 441.0 * (DisplayServer.window_get_size().x)/1241.0
		textureRect.size.y = 1241.0 * (DisplayServer.window_get_size().x)/1241.0
		add_child(textureRect)
		if not sprite.get("Animation"):
			sprite["Animation"] = "none"
		match(sprite.get("Animation")):
			"jump":
				textureRect.jump()
			"slide":
				textureRect.slide(20)

func _on_game_next_text(newCharacter: String, newText: String, newSprites: Array) -> void:
	showSprites(newSprites)


func _on_game_resized() -> void:
	print((DisplayServer.window_get_size().x)/1241.0)
