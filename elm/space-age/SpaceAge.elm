module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


secondsPerEarthYear : Float
secondsPerEarthYear =
    31557600


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    let
        age planetYearRel =
            seconds / (planetYearRel * secondsPerEarthYear)
    in
        case planet of
            Earth ->
                age 1

            Mercury ->
                age 0.2408467

            Venus ->
                age 0.61519726

            Mars ->
                age 1.8808158

            Jupiter ->
                age 11.862615

            Saturn ->
                age 29.447498

            Uranus ->
                age 84.016846

            Neptune ->
                age 164.79132
