module SecretHandshake (handshake) where

toBinary x =
    if x <= 1 then
        show x
    else
        let
            bitString =
                show (x `mod` 2)
            shiftedDown =
                quot x 2
        in
            (toBinary shiftedDown) ++ bitString


allActions =
    [ "wink"
    , "double blink"
    , "close your eyes"
    , "jump"
    ]


iterateActions actions reverseBinary result =
    case actions of
        [] ->
            if take 1 reverseBinary == "1" then
                result -- already reversed
            else
                reverse result -- un-reverse

        thisAction:restOfActions ->
            let
                restOfBits =
                    drop 1 reverseBinary
            in
                if take 1 reverseBinary == "1" then
                    iterateActions restOfActions restOfBits (thisAction : result)
                else
                    iterateActions restOfActions restOfBits result


handshake x =
    iterateActions allActions (reverse $ toBinary x) []
