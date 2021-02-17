{-# OPTIONS -Wall -Werror #-}

replicate' :: (Integral a) => a -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1) x


take' :: (Integral a) => a -> [b] -> [b]
take' _ [] = []
take' n _
  | n <= 0 = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' a = a : repeat' a

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: (Ord a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs)
  | a == x = True
  | otherwise = elem' a xs

unsort :: [Integer]
unsort = [4, 2, 8, 9, 0, 7, 2, 1]


quicksort :: (Ord a) => [a] -> [a]
quicksort []     = []
{-
quicksort (x:xs) = quicksort [a | a <- xs, a <= x]
                   ++ [x]
                   ++ quicksort [a | a <- xs, a > x]
-}
quicksort (x:xs) = quicksort smallOrEqual ++ [x] ++ quicksort larger
  where smallOrEqual = [a | a <- xs, a <= x]
        larger       = [a | a <- xs, a > x]
