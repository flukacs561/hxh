module Main where

import System.Environment

dispatch :: String -> (String -> String)
dispatch = undefined

main :: IO ()
main = do
  args <- getArgs
  input <- getContents
  putStrLn $ dispatch (head args) input
