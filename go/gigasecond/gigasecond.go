package gigasecond

import "time"

// Constant declaration.
const testVersion = 4

// AddGigasecond Add a billion seconds to a time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
