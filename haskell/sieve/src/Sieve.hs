module Sieve (primesUpTo) where


helper :: Integer -> [Integer] -> [Integer] -> [Integer]
helper n candidates primes =
    if (n<2) || (null candidates) then
        primes
    else
        let
            nextPrime =
                head candidates
            remaining =
                filter (\x -> (x `mod` nextPrime) /= 0) candidates
        in
            helper n remaining (primes ++ [nextPrime])


primesUpTo :: Integer -> [Integer]
primesUpTo n =
    helper n [2..n] []
