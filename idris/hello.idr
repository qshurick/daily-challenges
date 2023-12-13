module Main

spread : Int -> (Int, Int)
spread number = (div number 10, mod number 10)

compareHands : (Int, Int) -> (Int, Int) -> Bool
compareHands (firstHigh, firstLow) (secondHigh, secondLow) =
    firstHigh * 10 + firstLow > secondHigh * 10 + secondLow

check : (Int, Int) -> (Int, Int) -> Bool
check (firstHigh, firstLow) (secondHigh, secondLow) =
    if firstHigh > firstLow then (compareHands (firstHigh, secondHigh) (firstLow, secondLow)) else (compareHands (secondHigh, firstLow) (firstHigh, secondLow))

playGame : Int -> Int -> Bool
playGame first second = check (spread first) (spread second) where

isWinner : Int -> Int -> String
isWinner f s = if playGame f s then "Paul won!" else "Paul lose"

testData : (List(Int, Int))
testData = [(41, 79), (12, 28), (67, 53), (77, 54)]

test : (List(Int, Int)) -> IO ()
test [] = putStrLn "Done!"
test ((a, b)::rest) = do
    putStrLn (isWinner a b)
    test rest

main : IO ()
main = test testData
