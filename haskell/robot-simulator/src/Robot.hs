module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot =
    Robot Bearing (Integer, Integer)
    deriving Show


bearing :: Robot -> Bearing
bearing robot =
    case robot of
        Robot b _ -> b


coordinates :: Robot -> (Integer, Integer)
coordinates robot =
    case robot of
        Robot _ (x,y) -> (x,y)


mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot


executeInstruction :: Robot -> Char -> Robot
executeInstruction robot instruction =
    case (instruction, robot) of
        ('A', Robot North (x, y)) -> Robot North (x, y+1) 
        ('A', Robot South (x, y)) -> Robot South (x, y-1) 
        ('A', Robot East (x, y)) -> Robot East (x+1, y) 
        ('A', Robot West (x, y)) -> Robot West (x-1, y) 
        ('R', Robot b (x,y)) -> Robot (turnRight b) (x,y)
        ('L', Robot b (x,y)) -> Robot (turnLeft b) (x,y)


simulate :: Robot -> String -> Robot
simulate robot instructions =
    foldl executeInstruction robot instructions


turnLeft :: Bearing -> Bearing
turnLeft b =
    case b of
        North -> West
        East -> North
        South -> East
        West -> South


turnRight :: Bearing -> Bearing
turnRight b =
    case b of
        North -> East
        East -> South
        South -> West
        West -> North
