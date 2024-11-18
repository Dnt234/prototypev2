extends Node2D
var user_money = 1
var cost = 1
var upgrade = 0
func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
	cost = num

func _on_button_pressed() -> void:
	if user_money >= cost:
		upgrade += 1
		user_money -= cost
		cost = cost*1.5
		round_to_dec(cost, 1)
		$Button.text = "Cost:" + str(cost)
		_update_button_state()
		$TextureRect/RichTextLabel.text = str(user_money)


func _on_timer_timeout() -> void:
	user_money += upgrade
	$TextureRect/RichTextLabel.text = str(user_money)
	_update_button_state()
	
	
func _update_button_state() -> void:
	if user_money < cost:
		$Button.disabled = true
	else:
		$Button.disabled = false 
