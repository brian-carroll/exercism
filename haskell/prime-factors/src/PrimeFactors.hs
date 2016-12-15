module PrimeFactors (primeFactors) where


findNextPrime :: [Integer] -> Integer -> [Integer]
findNextPrime knownPrimes start =
    let
        isPrime =
            not $ any (\p -> start `mod` p == 0) knownPrimes
    in
        if isPrime then
            start : knownPrimes
        else
            findNextPrime knownPrimes (start+1)


helper :: [Integer] -> [Integer] -> Integer -> [Integer]
helper primes factors n =
    let
        currentPrime =
            head primes
    in
        if n == 1 then
            factors
        else if n `mod` currentPrime == 0 then
            helper
                primes
                (factors ++ [currentPrime])
                (n `quot` currentPrime)
        else
            helper  
                (findNextPrime primes currentPrime)
                factors
                n


primeFactors :: Integer -> [Integer]
primeFactors n =
    helper [2] [] n
