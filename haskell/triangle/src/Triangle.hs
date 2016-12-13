module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

-- triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c =
    if a>b+c || b>a+c || c>a+b then
        Illegal
    else if a==b && b==c then
        if a == 0 then
            Illegal
        else
            Equilateral
    else if a==b || b==c || a==c then
        Isosceles
    else 
        Scalene
