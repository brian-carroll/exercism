module GradeSchool exposing (..)

import Dict exposing (Dict)


type alias School = Dict Int (List String)


empty : School
empty =
    Dict.empty


addStudent : Int -> String -> School -> School
addStudent grade name school =
    let
        updateGradeList : Maybe (List String) -> Maybe (List String)
        updateGradeList v =
            case v of
                Nothing ->
                    Just [name]
                Just list ->
                    Just (List.sort (name :: list))
    in
        Dict.update grade updateGradeList school


studentsInGrade : Int -> School -> List String
studentsInGrade grade school =
    Maybe.withDefault [] (Dict.get grade school)


allStudents : School -> List (Int, List String)
allStudents =
    Dict.toList
