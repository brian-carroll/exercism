module School (School, add, empty, grade, sorted) where

import Data.List

{-
Need to insert in order => Data.List.insert
No tests for duplicates => Don't need sets

Maps? Requires converting back and forth
Data.List.lookup does part of the job
Data.List partition => split into matching and non-matching


Modifying a class:
    Convert to map
    lookup -> Maybe
    manipulate
    insert
    Convert back

Modifying a class:
    partition
    modify matching part
    insert

-}

type Grade = Int
type Student = String
type School = [(Grade, [Student])]


add :: Grade -> Student -> School -> School
add g student school =
    let
        (target_grade, other_grades) =
            partition (\x -> (fst x) == g) school

        updated_grade =
            case target_grade of
                [] ->
                    (g, [student])

                [(g, student_list)] ->
                    (g, insert student student_list)
    in
        insert updated_grade other_grades


empty :: School
empty =
    []


grade :: Grade -> School -> [Student]
grade g school =
    case (lookup g school) of
        Nothing ->
            []
        Just x ->
            x

-- I'm constructing the school in sorted order anyway, so nothing to do here!
sorted :: School -> School
sorted =
    id
