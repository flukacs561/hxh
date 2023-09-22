module Main where

import Tableformatter

import System.Environment
import Data.List ( nub )

dispatch :: String -> (String -> String)
dispatch cmd 
  | cmd == "ft" = Tableformatter.processTable
  | cmd == "nub" = unlines . nub . lines
  | otherwise = throwError cmd

throwError :: String -> String -> String
throwError cmd _ = "Invalid argument: \"" ++ cmd ++ "\" is not an actual command in hxh."

main :: IO ()
main = do
  args <- getArgs
  input <- getContents
  putStrLn $ dispatch (head args) input
