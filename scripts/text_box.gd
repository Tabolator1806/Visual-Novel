extends VSplitContainer


@export var text:Resource
@export var character_name_node:Label
@export var character_text_node:Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_name_node.set_text(text.character_name)
	character_text_node.set_text(text.character_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
