package bob // package name must match the package name in bob_test.go

import (
	"strings"
)

const testVersion = 2 // same as targetTestVersion

/*
Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.
*/

// Hey get Bob's response
func Hey(sentence string) string {
	var trimmed = strings.TrimSpace(sentence)

	var saidNothing, isQuestion bool
	if trimmed == "" {
		saidNothing = true
		isQuestion = false
	} else {
		saidNothing = false
		isQuestion = trimmed[len(trimmed)-1] == '?'
	}

	var hasUpper = (strings.ToLower(trimmed) != trimmed)
	var hasNoLower = (strings.ToUpper(trimmed) == trimmed)
	var isShouting = hasUpper && hasNoLower

	if saidNothing {
		return "Fine. Be that way!"
	} else if isShouting {
		return "Whoa, chill out!"
	} else if isQuestion {
		return "Sure."
	}
	return "Whatever."
}
