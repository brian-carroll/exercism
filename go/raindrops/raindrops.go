package raindrops

import "fmt"

const testVersion = 2

// Convert number to raindrop sound
func Convert(x int) string {
	var pling, plang, plong, sound string
	if (x % 3) == 0 {
		pling = "Pling"
	}
	if (x % 5) == 0 {
		plang = "Plang"
	}
	if (x % 7) == 0 {
		plong = "Plong"
	}
	sound = pling + plang + plong
	if len(sound) > 0 {
		return sound
	}
	return fmt.Sprintf("%d", x)
}
