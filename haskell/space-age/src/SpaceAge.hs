module SpaceAge (Planet(..), ageOn) where

data Planet
    = Earth
    | Mercury
    | Venus
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds =
    let
        earth_year_in_sec =
            31557600

        orbit_in_earth_years =
            case planet of
                Earth -> 1
                Mercury -> 0.2408467
                Venus -> 0.61519726
                Mars -> 1.8808158
                Jupiter -> 11.862615
                Saturn -> 29.447498
                Uranus -> 84.016846
                Neptune -> 164.79132
    in
        seconds / (orbit_in_earth_years * earth_year_in_sec)
