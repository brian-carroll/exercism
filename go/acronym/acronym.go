package acronym

import "strings"

const testVersion = 2

func runeIsCapital(c rune) bool {
	if (c >= 'A') && (c <= 'Z') {
		return true
	}
	return false
}

func runeIsLetter(c rune) bool {
	if (c >= 'A') && (c <= 'Z') {
		return true
	}
	if (c >= 'a') && (c <= 'z') {
		return true
	}
	return false
}

// Abbreviate create abbreviation
func Abbreviate(name string) string {
	var initials []rune
	var prev = '0'
	for _, current := range name {
		var normalInitial = !runeIsLetter(prev)
		var camelCase = (!runeIsCapital(prev)) && runeIsCapital(current)

		if runeIsLetter(current) && (normalInitial || camelCase) {
			initials = append(initials, current)
		}
		prev = current
	}
	return strings.ToUpper(string(initials))
}
