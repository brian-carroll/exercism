package twelve

const testVersion = 1

var numbers = [13]string{
	"",
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth",
	"eleventh",
	"twelfth",
}

var gifts = [13]string{
	"",
	"a Partridge in a Pear Tree",
	"two Turtle Doves",
	"three French Hens",
	"four Calling Birds",
	"five Gold Rings",
	"six Geese-a-Laying",
	"seven Swans-a-Swimming",
	"eight Maids-a-Milking",
	"nine Ladies Dancing",
	"ten Lords-a-Leaping",
	"eleven Pipers Piping",
	"twelve Drummers Drumming",
}

// Song Generate lyrics of the Twelve Days of Christmas
func Song() string {
	var lyrics = ""
	for i := 1; i <= 12; i++ {
		lyrics += Verse(i) + "\n"
	}
	return lyrics
}

// Verse Generate one verse of the Twelve Days of Christmas
func Verse(n int) string {
	var verse = "On the " + numbers[n] + " day of Christmas my true love gave to me"
	for i := n; i > 1; i-- {
		verse += ", " + gifts[i]
	}
	verse += ", "
	if n > 1 {
		verse += "and "
	}
	verse += gifts[1] + "."
	return verse
}
