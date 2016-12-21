module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n
    | n<=0 = []
    | n==1 = [[1]]
    | otherwise =
        let
            prevRows =
                rows (n-1)
            lastRow =
                last prevRows
            middle =
                zipWith (+) (init lastRow) (tail lastRow)
            nextRow =
                [1] ++ middle ++ [1]
        in
            prevRows ++ [nextRow]
