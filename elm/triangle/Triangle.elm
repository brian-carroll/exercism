module Triangle exposing (..)


type Triangle =
    Equilateral
    | Isosceles
    | Scalene

{-
isValid
    - no negative sides
    - any two add up to more than the third
numMatchingSides
    make a list
    sort it
    compare consecutive things
    get running total
-}

triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    let
        positiveSides =
            a > 0 && b > 0 && c > 0
        satisfiesInequality =
            a < b+c && b < a+c && c < a+b
        ab = if a==b then 1 else 0
        ac = if a==c then 1 else 0
        bc = if b==c then 1 else 0
        numEqualPairs = ab + ac + bc
    in
        case (positiveSides, satisfiesInequality, numEqualPairs) of
            (False, _, _) ->
                Err "Invalid lengths"
            (True, False, _) ->
                Err "Violates inequality"
            (True, True, 0) ->
                Ok Scalene
            (True, True, 1) ->
                Ok Isosceles
            (True, True, 3) ->
                Ok Equilateral
            (True, True, _) ->
                Err "Mathematical impossibility occurred!"
