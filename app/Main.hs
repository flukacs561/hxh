module Main where

import Tableformatter

import System.Environment
import Data.List ( nub )
import Data.Time

dispatch :: String -> String -> IO ()
dispatch cmd 
  | cmd == "ft" = putStrLn . Tableformatter.processTable
  | cmd == "nub" = putStrLn . unlines . nub . lines
  | cmd == "note" = note
  | cmd == "date" = const insertDate
  | otherwise = putStrLn . throwError cmd

throwError :: String -> String -> String
throwError cmd _ = "Invalid argument: \"" ++ cmd ++ "\" is not an actual command in hxh."

getCurrentDate :: IO String
getCurrentDate = do
    currentTime <- getCurrentTime
    let formattedDate = formatTime defaultTimeLocale "%Y-%m-%d" currentTime
    return formattedDate

note :: String -> IO ()
note title = do
  date <- getCurrentDate
  putStrLn $ "---\ntitle: " <> title <> "author: Lukács Ferenc\ndate: " <> date <> "\ntags: \n---"

insertDate :: IO ()
insertDate = getCurrentDate >>= putStrLn 

main :: IO ()
main = do
  args <- getArgs
  input <- getContents
  dispatch (head args) input
