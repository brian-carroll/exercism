module DifferenceOfSquares exposing (..)


square : number -> number
square x =
    x * x


squareOfSum : number -> number
squareOfSum x =
    square (List.sum [1..x])


sumOfSquares : number -> number
sumOfSquares x =
    List.sum (List.map square [1..x])


difference : number -> number
difference x =
    squareOfSum x - sumOfSquares x
