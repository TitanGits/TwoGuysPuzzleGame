extends Area2D



func _on_JumpPad_area_entered(area):
	if area.name == "playerHere":
		get_tree().call_group("players","BoostUp")
