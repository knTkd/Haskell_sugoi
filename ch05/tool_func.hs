{-# OPTIONS -Wall -Werror #-}

-- 関数プログラマの道具箱


{-           map 関数
定義
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs
リストに関数を適用できる、多彩な高階関数
リスト内包表記でも同じことができる コードと文脈に応じて単純に読みやすい方を使うべき
-}

{-           filter 関数
述語とリストを受け取り、そのリストの要素のうち述語を満たすもののみからなるリストを返す
定義
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
  | p x       = x : filter p xs
  | otherwise = filter p xs
これもリスト内包表記でもできる 使い分け

filter を使った quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallOrEqual = filter (<=x) xs
        larger = filter (>x) xs
    in quicksort smallOrEqual ++ [x] ++ quicksort larger

-}

-- コラッツ列
--chain :: (Integral a) => a -> [a] これだと何故か警告 下のに変えると収まった
chain :: Integer -> [Integer]
chain n
  | n < 1  = []
  | n == 1 = n : chain 0
  | even n = n : chain (div n 2)
  | odd n  = n : chain (n * 3 + 1)
  | otherwise = error "what?"

-- 1から100までの数のうち、長さ15以上のコラッツ列の開始数になるものはいくつ？

-- mysolve
mysolve :: Integer
--mysolve = sum [if length (chain x) > 15 then 1 else 0 | x <- [1..100]]
mysolve = sum [1 | x <- [1..100], length (chain x) > 15]


-- 本での実装
numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15


-- mapに複数の引数を持つ関数を与えることも可能
{-
ghci> let listOfFuns = map (*) [0..]  -- 関数のリストになってる
ghci> (listOfFuns !! 4) 5             -- (4*) 5 と等価
20
-}
