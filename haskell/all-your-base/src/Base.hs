module Base (rebase) where

fromBase :: Integral a => a -> [a] -> a
fromBase inputBase inputDigits =
    let
        base =
            fromIntegral inputBase
        powers =
            reverse $
            take (length inputDigits) $
            map (\x -> fromIntegral $ round (base**x)) [0..]
    in
        sum $ zipWith (*) inputDigits powers


toBase :: Integral a => [a] -> a -> a -> [a]
toBase outputDigits outputBase x =
    if x==0 then
        outputDigits
    else
        toBase
            ((x `mod` outputBase) : outputDigits)
            outputBase
            (x `quot` outputBase)


rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase inputDigits =
    let
        validDigits =
            all (\x -> x>=0 && x<inputBase) inputDigits
        validInputBase =
            inputBase >= 2
        validOutputBase =
            outputBase >= 2
    in
        if validInputBase && validOutputBase && validDigits then
            Just $
                toBase [] outputBase $
                fromBase inputBase inputDigits
        else
            Nothing
