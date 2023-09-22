module Tableformatter
( processTable ) where

import Data.List

-- Types
type Cell = String

type Row = [Cell]

type Coloumn = [Cell]

type Table = [Row]

-- Functions
processTable :: String -> String
processTable inputString =
  formatTable $
    transpose $
      fmap addSurroundingWhitespace $
        transpose $
          evenLineLengths $
            extractCells inputString

formatTable :: Table -> String
formatTable table = unlines $ fmap (\row -> '|' : joinWith "|" row) table

joinWith :: String -> Row -> String
joinWith _ [] = []
joinWith sep (s : ss) = s ++ sep ++ joinWith sep ss

addSurroundingWhitespace :: Coloumn -> Coloumn
addSurroundingWhitespace = addLeadingWhitespace . addTrailingWhitespace

addLeadingWhitespace :: Coloumn -> Coloumn
addLeadingWhitespace = fmap (\cell -> if isSeparator cell then '-' : cell else ' ' : cell)

addTrailingWhitespace :: Coloumn -> Coloumn
addTrailingWhitespace col = fmap addSpace col
  where
    colWidth = foldl' (\maxLength x -> if isSeparator x then maxLength else max maxLength (length x)) 0 col
    addSpace cell
      | isSeparator cell = replicate (1 + colWidth) '-'
      | otherwise = cell ++ replicate (1 + colWidth - length cell) ' '

isSeparator :: Cell -> Bool
isSeparator = and . fmap (== '-')

evenLineLengths :: Table -> Table
evenLineLengths table = fmap evenLength table
  where
    colNumber = length $ head table
    evenLength row
      | length row < colNumber = row ++ replicate (colNumber - length row) ""
      | length row == colNumber = row
      | length row > colNumber = take colNumber row

-- Input: the table to be formated
-- Output: the matrix of cells
extractCells :: String -> Table
extractCells inputString = splitAtPipes <$> lines inputString

splitAtPipes :: String -> Row
splitAtPipes "" = []
splitAtPipes str =
  fmap removeSurroundingWhiteSpace $
    filter (/= "") $
      takeWhile (/= '|') str : splitAtPipes (tail $ dropWhile (/= '|') str)

removeSurroundingWhiteSpace :: Cell -> Cell
removeSurroundingWhiteSpace = removeTrailingWhitespace . removeLeadingWhiteSpace

removeLeadingWhiteSpace :: Cell -> Cell
removeLeadingWhiteSpace = dropWhile (\c -> or $ fmap (c ==) [' ', '\n', '\t'])

removeTrailingWhitespace :: Cell -> Cell
removeTrailingWhitespace = reverse . dropWhile (\c -> or $ fmap (c ==) [' ', '\n', '\t']) . reverse