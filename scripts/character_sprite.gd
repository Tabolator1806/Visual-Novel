extends TextureRect


var current_position = position.x
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slide(20)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func jump():
	for i in range(0,20):
		await get_tree().create_timer(0.01).timeout
		set_position(Vector2(position.x,position.y-i))
	for i in range(0,20):
		await get_tree().create_timer(0.01).timeout
		set_position(Vector2(position.x,position.y+i))
	
func slide(dist):
	var window_width = get_viewport().get_visible_rect().size.x
	for i in range(current_position,window_width - current_position):
		await get_tree().create_timer(0.0025).timeout
		set_position(Vector2(i,position.y))
	set_position(Vector2(current_position,position.y))
		
	#for i in range(0,dist*1.5):
		#await get_tree().create_timer(0.01).timeout
		#set_position(Vector2(position.x+i,position.y))
	#for i in range(0,dist*1.25):
		#await get_tree().create_timer(0.01).timeout
		#set_position(Vector2(position.x-i,position.y))
	
