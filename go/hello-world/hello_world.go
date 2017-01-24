// Package greeting First exercise in Go
package greeting

// testVersion identifies the version of the test program that you are
// writing your code to. If the test program changes in the future --
// after you have posted this code to the Exercism site -- nitpickers
// will see that your code can't necessarily be expected to pass the
// current test suite because it was written to an earlier test version.
const testVersion = 3

// HelloWorld First exercise in Go
func HelloWorld(greetee string) string {
	if greetee == "" {
		greetee = "World"
	}
	return ("Hello, " + greetee + "!")
}
