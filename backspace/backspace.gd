extends Button

@onready var input = get_node("../../input")

func _ready() -> void:
	connect("button_up", on_button_pressed)

func on_button_pressed():
	if len(input.text) > 0:
		input.delete_text(len(input.text)-1, len(input.text))
