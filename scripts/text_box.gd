extends Control


@export var character_name_node:Label
@export var character_text_node:Label
@export var text_pace:float
var current_character = ""
var current_text = ""
var text_in_progress = false
var skipped = false
var sprites = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func showText() -> void:
	text_in_progress = true
	var text = ""
	character_name_node.set_text(current_character)
	for letter in current_text:
		await get_tree().create_timer(text_pace).timeout
		if skipped:
			break
		text += letter
		character_text_node.set_text(text)
	text_in_progress = false
	skipped = false
func skip(text):
	if text_in_progress:
		skipped = true
		character_text_node.set_text(text)
	else:
		showText()
#func getText(chapter):
	#var file = "res://assets/dialog.json"
	#var json_as_text = FileAccess.get_file_as_string(file)
	#var json_as_dict = JSON.parse_string(json_as_text)
	#return json_as_dict["Chapters"][chapter]

func _on_game_next_text(newCharacter: String, newText: String, newSprites: Array) -> void:
	current_character = newCharacter
	current_text = newText
	sprites = newSprites
	showText()


func _on_game_skip_text() -> void:
	skip(current_text)
