extends Control

@onready var output = $output
@onready var input = $input
@onready var submit_button = $Button
@onready var timer = $Timer

var options
var count
var index = 0
var iteration = 0

func _ready() -> void:
	input.connect("text_submitted", on_text_submitted)
	timer.connect("timeout", on_timer_timeout)
	submit_button.connect("button_up", on_submit_button_pressed)
	randomize()

func on_text_submitted(text) -> void:
	if iteration > 0:
		return

	if len(text) < 1:
		return

	options = text.split(",", false)
	count = len(options)
	
	if count < 2:
		return
	
	index = randi()
	iteration = count + 25
	timer.start()

func on_timer_timeout():
	output.text = options[index % count]
	index += 1
	iteration -= 1
	if iteration < 1:
		timer.stop()

func on_submit_button_pressed():
	on_text_submitted(input.text)
