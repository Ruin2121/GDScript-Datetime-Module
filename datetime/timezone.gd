class_name TimeZone


var is_positive: bool
var hours: int
var minutes: int


func _to_string() -> String:
	var sig: String = "+" if is_positive else "-"
	return "%s%02d:%02d" % [sig, hours, minutes]


func _init(h: int = 0, m: int = 0, is_pos: bool = true) -> void:
	hours = h
	minutes = m
	is_positive = is_pos
