package hamming

import "errors"

const testVersion = 5

// Distance Hamming distance between two strings
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Strings are not the same length")
	}
	var diff = 0
	for i := range a {
		if a[i] != b[i] {
			diff++
		}
	}
	return diff, nil
}
