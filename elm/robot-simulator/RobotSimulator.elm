module RobotSimulator exposing (..)

import String


type Bearing
    = North
    | East
    | West
    | South


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight johnny5 =
    case johnny5.bearing of
        North ->
            { johnny5 | bearing = East }

        East ->
            { johnny5 | bearing = South }

        South ->
            { johnny5 | bearing = West }

        West ->
            { johnny5 | bearing = North }


turnLeft : Robot -> Robot
turnLeft johnny5 =
    case johnny5.bearing of
        North ->
            { johnny5 | bearing = West }

        East ->
            { johnny5 | bearing = North }

        South ->
            { johnny5 | bearing = East }

        West ->
            { johnny5 | bearing = South }


advance : Robot -> Robot
advance johnny5 =
    let
        oldCoords =
            johnny5.coordinates

        x =
            oldCoords.x

        y =
            oldCoords.y

        newCoords =
            case johnny5.bearing of
                North ->
                    { oldCoords | y = y + 1 }

                East ->
                    { oldCoords | x = x + 1 }

                South ->
                    { oldCoords | y = y - 1 }

                West ->
                    { oldCoords | x = x - 1 }
    in
        { johnny5 | coordinates = newCoords }


executeInstruction : Char -> Robot -> Robot
executeInstruction instruction johnny5 =
    case instruction of
        'L' ->
            turnLeft johnny5

        'R' ->
            turnRight johnny5

        'A' ->
            advance johnny5

        _ ->
            johnny5


simulate : String -> Robot -> Robot
simulate instructions johnny5 =
    String.foldl executeInstruction johnny5 instructions
