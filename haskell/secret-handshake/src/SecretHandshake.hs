{-# LANGUAGE FlexibleInstances #-}
module SecretHandshake (handshake) where

{-
Inspired by ed359's solution
-}


import qualified Data.Bits as Bits

bitFunctions :: [(Int, [String] -> [String])]
bitFunctions = 
    [ ( 0, (++ ["wink"]) )
    , ( 1, (++ ["double blink"]) )
    , ( 2, (++ ["close your eyes"]) )
    , ( 3, (++ ["jump"]) )
    , ( 4, reverse )
    ]


class HandshakeCode a where
    testBit :: a -> Int -> Bool

    handshake :: a -> [String]
    handshake code =
        let
            helper acc (bitIndex, action) =
                if testBit code bitIndex then
                    action acc
                else
                    acc
        in
            foldl helper [] bitFunctions


instance HandshakeCode Int where
    testBit = Bits.testBit


instance HandshakeCode String where
    testBit s bitIndex =
        let
            len = length s
            strIndex = len-bitIndex-1
        in
            if bitIndex >= len then
                False
            else
                (s !! strIndex) == '1'

