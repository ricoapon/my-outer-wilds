class_name GameTime extends Node

var days: int
var hours: int
var minutes: int

func _init(_days: int = 0, _hours: int = 0, _minutes: int = 0):
	assert(0 <= _days, "Days must be positive")
	assert(0 <= _hours && _hours <= 23, "Hour must be in the inclusive range [0,23]")
	assert(0 <= _minutes && _minutes <= 60, "Minutes must be in the inclusive range [0,59]")
	self.days = _days
	self.hours = _hours
	self.minutes = _minutes

func increase_minute(i: int = 1):
	minutes += i
	# In theory, you can pass i with a very large value. Should never happen though.
	while minutes >= 60:
		minutes = 0
		hours += 1
	while hours >= 24:
		hours = 0
		days += 1

func in_minutes():
	return days * 24 * 60 + hours * 60 + minutes
