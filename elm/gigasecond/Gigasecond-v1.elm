module Gigasecond exposing (add)

import Date exposing (Date)
import Time


add : Date -> Date
add d =
    Date.fromTime ((Date.toTime d) + (Time.second * 10^9))
