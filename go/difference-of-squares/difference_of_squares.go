package diffsquares

// Difference calculate difference between SquareOfSums and SumOfSquares
func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}

// SquareOfSums calculate square of the sum of the first n natural numbers
func SquareOfSums(n int) int {
	var ans = 0
	for i := 1; i <= n; i++ {
		ans += i
	}
	return ans * ans
}

// SumOfSquares calculate sum of squares of the first n natural numbers
func SumOfSquares(n int) int {
	var ans = 0
	for i := 1; i <= n; i++ {
		ans += i * i
	}
	return ans
}
