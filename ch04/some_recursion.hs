{-# OPTIONS -Wall -Werror #-}

-- さらにいくつかの再帰関数


--------------------- replicate ---------------------
-- 自分で試してみた実装
replicate' :: (Integral a) => a -> b -> [b]
replicate' 0 _ = []
replicate' n x = x : replicate' (n - 1) x

-- 本での実装
replicate'' :: Integer -> a -> [a]
replicate'' n x
  | n <= 0    = []
  | otherwise = x : replicate'' (n - 1) x


---------------------    take    ---------------------
-- 自分で試した実装 間違ってる！！！！！
take' :: Int -> [a] -> [a]
take' _ []     = []
take' 0 _      = []  -- > ここが間違ってる 0だけじゃなくて負の値が入った時もこれにしたい
                     -- > 正しくは下の本の実装で
take' n (x:xs) = x : take' (n - 1) xs

-- 本での実装
take'' :: Int -> [a] -> [a]
take'' n _
  | n <= 0 = []
take'' _ []     = []
take'' n (x:xs) = x : take'' (n-1) xs


---------------------     reverse   ---------------------
reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]


---------------------     repeat    ---------------------
repeat' :: a -> [a]
repeat' x = x : repeat' x


---------------------      zip      ---------------------
zip'' :: [a] -> [b] -> [(a,b)]
zip'' _ [] = []
zip'' [] _ = []
zip'' (x:xs) (y:ys) = (x,y) : zip'' xs ys


---------------------      elem      ---------------------
elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs)
  | a == x    = True
  | otherwise = elem' a xs
