package secret

const testVersion = 1

// Handshake output secret handshake for a given binary code
func Handshake(binary uint) []string {
	var handshake []string

	if binary&1 > 0 {
		handshake = append(handshake, "wink")
	}
	if binary&2 > 0 {
		handshake = append(handshake, "double blink")
	}
	if binary&4 > 0 {
		handshake = append(handshake, "close your eyes")
	}
	if binary&8 > 0 {
		handshake = append(handshake, "jump")
	}
	if binary&16 == 0 {
		return handshake
	}
	var rev []string
	var n = len(handshake)
	for i := n - 1; i >= 0; i-- {
		rev = append(rev, handshake[i])
	}
	return rev
}
