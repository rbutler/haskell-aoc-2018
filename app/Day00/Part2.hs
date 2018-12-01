module Day00.Part2 where

import System.TimeIt (timeItT)
import Text.Printf (printf)
import Control.Exception (evaluate)

import Day00

-- | solve the puzzle
solve :: [String] -> Integer
solve _ = 2

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day00: Part2: solve -> (%f, %d)\n" time result