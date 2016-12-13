module Raindrops (convert) where

convert :: Int -> String
convert x =
    let
        -- If the number has 3 as a factor, output 'Pling'.
        -- If the number has 5 as a factor, output 'Plang'.
        -- If the number has 7 as a factor, output 'Plong'.

        noise factor pliaong =
            if (x `mod` factor) == 0 then
                pliaong
            else
                ""            

        noises =
            (noise 3 "Pling") ++
            (noise 5 "Plang") ++
            (noise 7 "Plong")
    in
        if not $ null noises then
            noises
        else
            show x
