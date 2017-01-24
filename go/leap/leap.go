// Leap stub file

// The package name is expected by the test program.
package leap

// testVersion should match the targetTestVersion in the test file.
const testVersion = 3

// IsLeapYear Given a year, check if it's a leap year
func IsLeapYear(year int) bool {
	if (year % 400) == 0 {
		return true
	} else if (year % 100) == 0 {
		return false
	} else {
		return (year % 4) == 0
	}
}
