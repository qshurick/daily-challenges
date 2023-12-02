data TimeSuffix = AM | PM deriving (Show, Eq)

hoursPassed :: (Integer, TimeSuffix) -> (Integer, TimeSuffix) -> [Char]
hoursPassed startTime endTime
    | startTime == endTime = "no time passed"
    | otherwise = calculateHoursPassed startTime endTime

calculateHoursPassed :: (Integer, TimeSuffix) -> (Integer, TimeSuffix) -> [Char]
calculateHoursPassed (start, AM) (end, AM) = show(end - start)
calculateHoursPassed (start, PM) (end, PM) = show(end - start)
calculateHoursPassed (start, AM) (end, PM) = show(12 + end - start)
calculateHoursPassed (_, _) (_, _) = "impossible time combination"

testCases = [ ("Hours passed between 1 AM and 1 PM is ", hoursPassed (1, AM) (1, PM))
             ,("Hours passed between 1 AM and 4 AM is ", hoursPassed (1, AM) (4, AM))
             ,("Hours passed between 3 PM and 8 PM is ", hoursPassed (3, PM) (8, PM))
             ,("Hours passed between 2 PM and 1 AM is ", hoursPassed (2, PM) (1, AM))
             ,("Hours passed between 1 AM and 1 AM is ", hoursPassed (1, AM) (1, AM))]

printTests :: [([Char], [Char])] -> [Char]
printTests [] = ""
printTests (first:rest) = printTest first ++ printTests rest

printTest :: ([Char], [Char]) -> [Char]
printTest (title, hours) = title ++ hours ++ "\n"

main = putStrLn(printTests testCases)
