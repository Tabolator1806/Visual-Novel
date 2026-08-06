extends Control

var current_character = ""
var current_text = ""
var chapter = "One"
var index = 0
var sprites = []
var json = load("res://assets/dialog.json")
@export var spritesContainer:HBoxContainer
@export var textBox:Panel
var text_in_progress = false
signal nextText(newCharacter:String, newText:String, newSprites:Array)
signal skipText()

func _ready() -> void:
	next()

func _process(delta: float) -> void:
	text_in_progress = textBox.text_in_progress
func getDataFromJSON(chapter):
	var file = "res://assets/dialog.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var real_json = json_as_dict["Chapters"][chapter]
	current_character = real_json[index]["Character"]
	current_text = real_json[index]["Text"]
	sprites = real_json[index]["Sprites"]
func next():
	if not text_in_progress:
		getDataFromJSON(chapter)
		nextText.emit(current_character,current_text,sprites)
		index+=1
	else:
		skipText.emit()
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index==1 and event.pressed:
			next()
