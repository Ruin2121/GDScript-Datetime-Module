class_name Date extends BaseDateTime
## A date object, conforming to the Gregorian Calendar.
##
## @experimental


func _init(year: int, month: int = 1, day: int = 1) -> void:
	assert(_validate_month(month), "Month (%s) is not between 1 and 12." % month as String)
	assert(_validate_day(year, month, day), "Day (%s) is not valid for the given month/year" % day as String)


