extends Node2D


onready var label = $CanvasLayer/PanelContainer/GridContainer/Label
onready var type_label = $CanvasLayer/PanelContainer/GridContainer/Type
onready var hints_label = $CanvasLayer/Hints/Label

var value_to_calculate = []
var type_float_label = "Type: float"
var type_sgfixed_label = "Type: SGFixed"

var calculated = false

func _ready() -> void:
	type_label.text = type_float_label
	
	
func _on_Button0_pressed(value = "0") -> void:
	append_value(value)
	
	
func _on_Button1_pressed(value = "1") -> void:
	append_value(value)


func _on_Button2_pressed(value = "2") -> void:
	append_value(value)
	
	
func _on_Button3_pressed(value = "3") -> void:
	append_value(value)


func _on_Button4_pressed(value = "4") -> void:
	append_value(value)


func _on_Button5_pressed(value = "5") -> void:
	append_value(value)
	

func _on_Button6_pressed(value = "6") -> void:
	append_value(value)
	

func _on_Button7_pressed(value = "7") -> void:
	append_value(value)


func _on_Button8_pressed(value = "8") -> void:
	append_value(value)


func _on_Button9_pressed(value = "9") -> void:
	append_value(value)


func _on_ButtonDot_pressed(value=".") -> void:
	append_value(value)


func _on_ButtonResult_pressed() -> void:
	var result = value_to_string()
		
	result = SGFixed.from_float(float(result))
	value_to_calculate = result
	type_label.text = type_sgfixed_label
	label.text = String(result)
	
	calculated = true
		
	print(result)
	

func _on_ButtonClear_pressed() -> void:
	clear()
	type_label.text = type_float_label
	
	

func clear() -> void:
	if (calculated == true):
		value_to_calculate = []
	value_to_calculate.clear()
	label.text = ""
	calculated = false
	hints_label.text = "Cleared!"


func append_value(value):
	if (calculated == true):
		return
	clear_hint_label()
	value_to_calculate.append(value)
	update_value_to_calculate_label()
	
	
func update_value_to_calculate_label():
	label.text = value_to_string()


func value_to_string() -> String:
	if (calculated == true):
		return value_to_calculate
	var result = ""
	for i in range(0,value_to_calculate.size()):
		result += value_to_calculate[i]
		
	return result


func _on_ButtonClipboard_pressed() -> void:
	if(calculated == false):
		return
	OS.set_clipboard(String(value_to_calculate))
	hints_label.text = "Copied to clipboard"


func _on_ButtonPaste_pressed() -> void:
	if(calculated == true):
		return
	value_to_calculate = OS.get_clipboard()
	hints_label.text = "Paste from clipboard"
	
	
func clear_hint_label():
	hints_label.text = ""
