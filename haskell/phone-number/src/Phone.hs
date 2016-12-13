module Phone (areaCode, number, prettyPrint) where

areaCode :: String -> Maybe String
areaCode dirty =
    case number dirty of
        Just clean ->
            Just (take 3 clean)
        Nothing ->
            Nothing


number :: String -> Maybe String
number dirty =
    let
        clean =
            filter (\c -> c>='0' && c<='9') dirty
        len =
            length clean
    in
        if len == 10 then
            Just clean
        else if (len == 11) && (head clean == '1') then
            Just (tail clean)
        else
            Nothing


prettyPrint :: String -> Maybe String
prettyPrint dirty =
    case number dirty of
        Nothing ->
            Nothing

        Just num ->
            let
                (area, rest) =
                    splitAt 3 num

                (first3, last4) =
                    splitAt 3 rest
            in
                Just $ "(" ++ area ++ ") " ++ first3 ++ "-" ++ last4
