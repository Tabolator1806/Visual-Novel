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
		var textureRect = TextureRect.new()
		textureRect.texture = load("res://assets/sprites/"+sprite["File"])
		add_child(textureRect)



func _on_ui_next_text(newCharacter: String, newText: String, newSprites: Array) -> void:
	showSprites(newSprites)
