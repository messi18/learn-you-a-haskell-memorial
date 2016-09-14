import Data.List
-- list comprehention.
length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase xs = [x | x <- xs, x `elem` ['A' .. 'Z']]

-- remove odd numbers without flatten list of list.
removeOddNum :: [[Int]] -> [[Int]]
removeOddNum xxs = [ [ x | x <- xs, even x] | xs <- xxs]
