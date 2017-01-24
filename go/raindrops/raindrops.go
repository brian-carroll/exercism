package raindrops

import "fmt"

const testVersion = 2

// Convert number to raindrop sound
func Convert(x int) string {
	var sound = ""
	if (x % 3) == 0 {
		sound += "Pling"
	}
	if (x % 5) == 0 {
		sound += "Plang"
	}
	if (x % 7) == 0 {
		sound += "Plong"
	}
	if len(sound) > 0 {
		return sound
	}
	return fmt.Sprintf("%d", x)
}
