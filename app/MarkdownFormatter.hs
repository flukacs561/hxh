module MarkdownFormatter ( listToCheckbox ) where

import Data.List ( isPrefixOf )

type Line = String

whitespace :: [Char]
whitespace = [' ', '\t', '\n']

listToCheckbox :: String -> String
listToCheckbox = unlines . fmap makeCheckbox . lines

isListItem :: Line -> Bool
isListItem = isPrefixOf "- "

makeCheckbox :: Line -> Line
makeCheckbox ('-':' ':line) = "- [ ] " <> line
makeCheckbox line = line
