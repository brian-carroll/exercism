module Clock (clockHour, clockMin, fromHourMin, toString) where

data Clock =
    Clock Int Int
    deriving (Show, Eq)

instance Num Clock where
    Clock a b + Clock c d =
        fromHourMin (a+c) (b+d)

    fromInteger m =
        fromHourMin 0 (fromInteger m)

    negate (Clock a b) =
        let
            m = (24*60)-((a*60) +b)
        in
            fromHourMin 0 m


clockHour :: Clock -> Int
clockHour c =
    case c of
        Clock h m -> h


clockMin :: Clock -> Int
clockMin c =
    case c of
        Clock h m -> m


fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
    let
        totalMins = h*60 + m
        wrapped = (1440+totalMins) `mod` 1440
        m' = wrapped `mod` 60
        h' = quot wrapped 60
    in
        Clock h' m'


twoDigits x =
    if x<10 then
        '0' : show x
    else
        show x


toString :: Clock -> String
toString c =
    case c of
        Clock h m ->
            let
                hh = twoDigits h
                mm = twoDigits m
            in
                hh ++ ":" ++ mm
