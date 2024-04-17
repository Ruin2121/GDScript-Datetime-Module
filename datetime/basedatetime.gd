class_name BaseDateTime
## Base datetime object. Adheres to Gregorian calendar.
##
## A base representation for date and time system adhering to the standard Gregorian calendar.
## This base class should contain all common functionality for the derivative objects to function.
##
## @experimental

var year: int
var month: int
var day: int
var hour: int
var minute: int
var second: int
var decimal_fraction: int
var time_zone: TimeZone

## Number of days in each month, index 0 is a placeholder to index months with expected numbers.
const _DAYS_IN_MONTH: Array[int] = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


## Full names of each month, index 0 is a placeholder to index months with expected numbers.
const _MONTHS: Array[String] = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


## Abreviated names of each month, index 0 is a placeholder to index months with expected numbers.
const _ABV_MONTHS: Array[String] = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]


## Determines if the year is a leap year.
func _is_leap_year(y: int) -> bool:
	return true if y % 4 == 0 and (y % 100 != 0 or y % 400 == 0) else false


## Returns the number of days in the given month for the given year.
func _days_in_month(y: int, mo: int) -> int:
	if mo == 2 and _is_leap_year(y):
		return _DAYS_IN_MONTH[mo] + 1
	else:
		return _DAYS_IN_MONTH[mo]


func _validate_month(mo: int) -> bool:
	if 1 <= mo as int <= 12:
		return true
	else:
		return false


func _validate_day(y: int, mo: int, d: int) -> bool:
	if 1 <= d as int <= _days_in_month(y, mo):
		return true
	else:
		return false


func _to_string() -> String:
	return "%04d-%02d-%02dT%02d:%02d:%02d.%03d%s" % [year, month, day, hour, minute, second, decimal_fraction, time_zone]
