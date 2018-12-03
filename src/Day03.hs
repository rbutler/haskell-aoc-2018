{-|
Problem: <https://adventofcode.com/2018/day/3>

Solution:

General - ???

Part 1 - ???

Part 2 - ???
-}
module Day03 where

import Data.List.Split (splitOneOf)

import qualified Data.Map as M

import Util (inputRaw)

-- | Claim cid cposition cdimension
data Claim = Claim Int (Int, Int) (Int, Int) deriving (Show, Eq)

-- | Fabric position (cids that claimed that position, claims)
type Fabric = M.Map (Int, Int) ([Int], Int)

-- | read the input file.
input :: [Claim]
input = (map processLine . inputRaw) "input/Day03input.txt" where
  processLine l = Claim cid' cposition' cdimension' where
    -- #1 @ 335,861: 14x10
    tokens = splitOneOf "#@,:x " l
    cid' = read $ tokens !! 1
    cposition' = (read $ tokens !! 4, read $ tokens !! 5)
    cdimension' = (read $ tokens !! 7, read $ tokens !! 8)

-- | make/stake a claim on an fabric area (increase the counter of the
-- relevant cells by one).
claim :: Fabric -> Claim -> Fabric
claim f (Claim cid (row, col) (rdim, cdim)) = foldl claimInch f cells where
  cells = [(r, c) | r <- [row..row + rdim - 1], c <- [col..col + cdim - 1]]
  claimInch f' p' = M.insert p' (cids ++ [cid], claims + 1) f' where
    (cids, claims) = M.findWithDefault ([],0) p' f'
