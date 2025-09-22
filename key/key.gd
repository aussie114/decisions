extends Button

@onready var input = get_node("../../input")

func _ready() -> void:
	connect("button_up", on_button_pressed)

func on_button_pressed():
	input.text += text.to_lower()
