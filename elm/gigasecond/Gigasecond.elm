module Gigasecond exposing (add)

import Date exposing (Date)
import Time


gs : Float
gs =
    Time.second * 10^9


add : Date -> Date
add d =
    Date.fromTime ((Date.toTime d) + gs)
