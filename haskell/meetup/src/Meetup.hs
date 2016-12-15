module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, toGregorian, fromGregorianValid, diffDays)
import Data.Maybe

data Schedule
    = First
    | Second
    | Third
    | Fourth
    | Last
    | Teenth
    deriving Show

data Weekday
    = Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday
    deriving (Show, Eq)


-- Pick any base date whose day-of-the-week is known
baseDay = fromGregorian 2012 1 2
baseDayOfWeek = Monday


dayOfWeek :: Day -> Weekday
dayOfWeek d =
    case (diffDays d baseDay) `mod` 7 of
        0 -> Monday
        1 -> Tuesday
        2 -> Wednesday
        3 -> Thursday
        4 -> Friday
        5 -> Saturday
        6 -> Sunday


isTeenth :: Day -> Bool
isTeenth d =
    let
        (y,m,date) = toGregorian d
    in
        (date >= 13) && (date <= 19)


meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month =
    let
        allDaysInMonth =
            catMaybes $ map (fromGregorianValid year month) [0..31]

        rightDayOfWeek =
            filter (\d -> dayOfWeek d == weekday) allDaysInMonth
    in
        case schedule of
            First ->
                rightDayOfWeek !! 0

            Second ->
                rightDayOfWeek !! 1

            Third ->
                rightDayOfWeek !! 2

            Fourth ->
                rightDayOfWeek !! 3

            Last ->
                last rightDayOfWeek

            Teenth ->
                head $ filter isTeenth rightDayOfWeek
