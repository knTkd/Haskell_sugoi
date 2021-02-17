{-# OPTIONS -Wall -Werror #-}

-- ラムダ式

{-
一回だけ必要な関数を作るときに使う無名関数
通常ラムダ式は高階関数に渡す関数を作るためだけに使われる
-}
chain :: Integer -> [Integer]
chain n
  | n < 1  = []
  | n == 1 = [1]
  | odd n  = n : chain (n * 3 + 1)
  | even n = n : chain (div n 2)
  | otherwise = error "Is is really Integer ?"
-- where束縛を使わずに、ラムダ式を使って書き換えたもの
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15)
                        (map chain [1..100]))
{-
以下の式は等価
map (+3) (take 4 [1..])
map (\x -> x + 3) (take 4 [1..])
-}

{-
  任意の数の引数を受け取るラムダ式
zipWith (\a b -> a + b) [5,3] [2,3]


ラムダ式でもパターンマッチをすることができる
map (\(a, b) -> a + b) [(1,2), (4,2), (8,0)]
>> [3,6,8]
-}


-- この2つの関数は等価
-- 関数はデフォルトでカリー化されているため
addThree :: Int -> Int -> Int -> Int
addThree  x y z = x + y + z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z -> x + y + z
{-
2つ目の例でラムダ式が括弧で囲まれていないことに注意
ラムダ式を括弧無しで書いた場合、->の右側すべてがそのラムダ式に属す
-}

-- カリー化の記法のほうが便利な例
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x
{-
flip' f x y = f y xと書いても全く同じだけど、ラムダ式を使う書き方のほうが、新しい関数を生成するというflipの典型的な使い方をよく表している

flipで一番多い使い方は、引数として関数のみ、もしくは関数と引数をひとつだけ渡し、生成された関数をmapやzipWithに渡すという方法

ghci> zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]
["i love you", "you love me"]

ghci> map (flip subtract 20) [1..4]
[19,18,17,16]

うまくラムダ式を使えば、その関数は部分適用され引数として別の関数に渡されるもの、という糸を明確にできる
-}
