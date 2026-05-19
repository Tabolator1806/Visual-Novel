extends Control


@export var text:Resource
@export var character_name_node:Label
@export var character_text_node:Label
@export var text_pace:float
var text_in_progress = false
var skipped = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	showText(text.character_name,text.character_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func showText(name,text) -> void:
	text_in_progress = true
	var current_text = ""
	character_name_node.set_text(name)
	for letter in text:
		await get_tree().create_timer(text_pace).timeout
		if skipped:
			break
		current_text += letter
		character_text_node.set_text(current_text)
	text_in_progress = false
	skipped = false
func skip_text(text):
	if text_in_progress:
		skipped = true
		character_text_node.set_text(text)
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index==1 and event.pressed:
			skip_text(text.character_text)
			
