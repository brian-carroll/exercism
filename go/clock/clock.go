package clock

import (
	"fmt"
)

const testVersion = 4

// Clock Type for time values
type Clock struct {
	hour   int
	minute int
}

// New Clock value
func New(hour, minute int) Clock {
	var c Clock
	var dayMins = 24 * 60
	var totalMins = (dayMins + ((minute + (hour * 60)) % dayMins)) % dayMins
	c.minute = totalMins % 60
	c.hour = totalMins / 60
	return c
}

func (c Clock) String() string {
	var strMin, strHour string
	if c.hour < 10 {
		strHour = fmt.Sprintf("0%d", c.hour)
	} else {
		strHour = fmt.Sprintf("%d", c.hour)
	}
	if c.minute < 10 {
		strMin = fmt.Sprintf("0%d", c.minute)
	} else {
		strMin = fmt.Sprintf("%d", c.minute)
	}
	return strHour + ":" + strMin
}

func (c Clock) Add(minutes int) Clock {
	var totalMins = c.minute + minutes
	return New(c.hour, totalMins)
}
