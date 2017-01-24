package triangle

import (
	"math"
	"sort"
)

const testVersion = 3

// Kind of triangle
type Kind int

// Pick values for the following identifiers used by the test program.
const (
	NaT Kind = 0 // not a triangle
	Equ Kind = 3 // equilateral
	Iso Kind = 2 // isosceles
	Sca Kind = 1 // scalene
)

// KindFromSides determine triangle type given side measurements
func KindFromSides(a, b, c float64) Kind {

	// Triangles must have positive sides. Not negative, zero or NaN.
	if !(a > 0 && b > 0 && c > 0) {
		return NaT
	}

	// All sides must be finite
	var i = math.Inf(1)
	if a == i || b == i || c == i {
		return NaT
	}

	// Triangle inequality must be satisfied
	var sorted = []float64{a, b, c}
	sort.Float64s(sorted)
	if sorted[2] > sorted[1]+sorted[0] {
		return NaT
	}

	// Check for equal sides
	var ab = (a == b)
	var bc = (b == c)
	var ac = (a == c)

	// Determine kind of triangle
	if ab && bc && ac {
		return Equ
	} else if ab || bc || ac {
		return Iso
	}

	return Sca
}
