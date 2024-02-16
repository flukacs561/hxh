module LatexCommands (insertLatexTemplate, makeEnvironment) where

import System.IO

insertLatexTemplate :: IO String
insertLatexTemplate = do
  handle <- openFile "template.tex" ReadMode
  hGetContents' handle

makeEnvironment :: String -> String
makeEnvironment envName =
  unlines
    [ "\\begin{" ++ envName ++ "}",
      "\\end{" ++ envName ++ "}"
    ]
