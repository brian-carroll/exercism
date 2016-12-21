module Sieve (primesUpTo) where


notMultipleOf :: Integer -> Integer -> Bool
notMultipleOf d n =
    (n `mod` d) /= 0


helper :: Integer -> [Integer] -> [Integer] -> [Integer]
helper n candidates primes =
    if (n<2) || (null candidates) then
        primes
    else
        let
            nextPrime =
                head candidates
            remaining =
                filter (notMultipleOf nextPrime) candidates
        in
            helper n remaining (primes ++ [nextPrime])


primesUpTo :: Integer -> [Integer]
primesUpTo n =
    helper n [2..n] []
