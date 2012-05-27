import System.Random
import Random
import System.IO
import Data.List

main = do
	notWorthy <- readFile "notworthy.txt"
	attendees <- readFile "attendees.txt"
	let notWorthyLines = lines notWorthy
	let attendeesPerLine = lines attendees
	let filteredAttendees = filter (`notElem` notWorthyLines) attendeesPerLine
	let numAttendees = length filteredAttendees
	luckyNum <- Random.randomRIO(0, numAttendees - 1)
	putStrLn ("And the lucky number is: " ++ (show luckyNum) ++ 
		" (out of " ++ (show numAttendees) ++ "). The winner is " ++ 
		((!!) filteredAttendees luckyNum) ++ ".")
