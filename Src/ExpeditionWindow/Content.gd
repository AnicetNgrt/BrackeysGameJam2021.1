extends Control

export var green_text : String = "Confirm"
export var red_text : String = "Cancel"

export var green_signal : String = "expedition_started"
export var red_signal : String = "window_close"
export var green_args : Array = []
export var red_args : Array = [Types.WindowType.Expedition]


func _ready():
	if green_args.empty() :
		#warning-ignore:return_value_discarded
		$BaseButtonGreen.connect("pressed", Events, "emit_signal", [green_signal])
	else :
		#warning-ignore:return_value_discarded
		$BaseButtonGreen.connect("pressed", Events, "emit_signal", [green_signal] + green_args)
	
	if red_args.empty() :
		#warning-ignore:return_value_discarded
		$BaseButtonPink.connect("pressed", Events, "emit_signal", [red_signal])
	else :
		#warning-ignore:return_value_discarded
		$BaseButtonPink.connect("pressed", Events, "emit_signal", [red_signal] + red_args)
	
	$BaseButtonGreen.setText(green_text)
	$BaseButtonPink.setText(red_text)

func reset():
	pass

func setup(_payload):
	print("ExpeditionWindow setup()")

func _on_BaseButtonPink_button_up():
	print("button")
	Events.emit_signal(Events.WINDOW_CLOSE, get_parent())

func _on_CheckList_list_active(node):
	$DummyLabel.set_text(str(node.optionText))

