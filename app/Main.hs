module Main where

import TableFormatter
import DateCommands

import System.Environment
import Data.List ( nub )

dispatch :: Maybe String -> String -> IO ()
dispatch Nothing = putStrLn . const "No argument was provided."
dispatch (Just cmd)
  | cmd == "ft" = putStrLn . TableFormatter.processTable
  | cmd == "nub" = putStrLn . unlines . nub . lines
  | cmd == "note" = note
  | cmd == "date" = const $ getCurrentDate >>= putStrLn
  | cmd == "ddate" = const $ getCurrentDateWithDay >>= putStrLn
  | otherwise = putStrLn . const throwError cmd

throwError :: String -> String
throwError cmd = "Invalid argument: \"" ++ cmd ++ "\" is not an actual command in hxh."

note :: String -> IO ()
note title = do
  date <- getCurrentDate
  putStrLn $ "---\ntitle: " <> title <> "author: Lukács Ferenc\ndate: " <> date <> "\ntags: \n---"

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

main :: IO ()
main = do
  args <- getArgs
  input <- getContents
  dispatch (safeHead args) input
