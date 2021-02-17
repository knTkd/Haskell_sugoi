{-# OPTIONS -Wall -Werror #-}

-- 高階実演  (higer order function)

-- 関数と1つの引数を受け取り、関数を二階適用する関数
-- 最初の(a -> a)は引数で受け取る関数の型を表してる
--          (関数 f の型)    引数の型    返り値の型
applyTwice :: (a -> a)     ->   a     ->     a
applyTwice f x = f (f x)

{-
ghci> applyTwice (++ " HAHA") "HEY"
"HAHA HAHA HEY"

ghci> applyTwice (3:) [1]
[3, 3, 1]
-}

-- Python でいうところのマップも実装できる！ (追記 Haskellにもmapはあったというかこっちが先)
map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

-- zipWith 
zipWith' :: (a -> a -> b) -> [a] -> [a] -> [b]
zipWith' _ [] _ = []
zipWith' _ _ []          = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
{-
zipWith の使用例
zipWith (+) [4,2,5,6] [2,6,2,3]
zipWith max [4,2,5,6] [2,6,2,3]
zipWith (++) ["foo ", "bar "] ["fighters", "hoppers"]
zipWith (*) (replicate 5 2) [1..]
zipWith (zipWith (*)) [[1,2],[3,5]] [[3,2],[3,4]]
-}

-- filip
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

-- 関数がカリー化されていることを上手く使ったやり方
-- 型シグネイチャに注目 関数と引数2つをもらって、返り値を返す(上とは違う)
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f x y = f y x

{-
zipWith (flip div) (replicate 5 2) [2,4..]
-}
