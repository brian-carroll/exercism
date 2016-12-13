module Bob (responseFor) where

responseFor :: String -> String
responseFor input =
    let
        trimmed =
            unwords $ words input

        saidNothing =
            null trimmed

        -- Can avoid empty list condition using laziness to never evaluate this. Kind of brittle though
        question =
            (not saidNothing) && (last trimmed == '?')

        hasUpper =
            any (\c -> c>='A' && c<='Z') trimmed

        hasLower =
            any (\c -> c>='a' && c<='z') trimmed

        shouting =
            hasUpper && not hasLower
    in
        if saidNothing then
            "Fine. Be that way!"
        else if shouting then
            "Whoa, chill out!"
        else if question then
            "Sure."
        else
            "Whatever."
