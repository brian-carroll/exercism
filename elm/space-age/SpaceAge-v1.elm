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
    365.25 * 24 * 60 * 60


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    case planet of
        Earth ->
            seconds / (1 * secondsPerEarthYear)

        Mercury ->
            seconds / (0.2408467 * secondsPerEarthYear)

        Venus ->
            seconds / (0.61519726 * secondsPerEarthYear)

        Mars ->
            seconds / (1.8808158 * secondsPerEarthYear)

        Jupiter ->
            seconds / (11.862615 * secondsPerEarthYear)

        Saturn ->
            seconds / (29.447498 * secondsPerEarthYear)

        Uranus ->
            seconds / (84.016846 * secondsPerEarthYear)

        Neptune ->
            seconds / (164.79132 * secondsPerEarthYear)
