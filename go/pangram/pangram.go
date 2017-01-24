package pangram

import (
	"strings"
)

const testVersion = 1

const alphabet = "abcdefghijklmnopqurstuvwxyz"

// IsPangram check if all letters of the ASCII alphabet are in the input string
func IsPangram(rawinput string) bool {
	var input = strings.ToLower(rawinput)
	for _, c := range alphabet {
		if !strings.ContainsRune(input, c) {
			return false
		}
	}
	return true
}
