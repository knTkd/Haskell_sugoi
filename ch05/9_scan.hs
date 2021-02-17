{-# OPTIONS -Wall -Werror #-}

-- スキャン

{-
scanl と scanr 関数は foldl と foldr に似てるけど、アキュムレータの中間状態すべてをリストとして返す

scanl1 と scanr1 関数は foldl1  foldr1 のアナロジー

使用例
ghci> scanl (+) 0 [3,5,2,1]
[0,3,8,10,11]
ghci> scanr (+) 0 [3,5,2,1]
[11,8,3,1,0]
ghci> scanl1 (\acc x -> if x > acc then x else acc) 0 [3,4,5,3,7,9,2,1]
[0,3,4,5,5,7,9,9,9]
ghci> scanl (flip (:)) [] [3,2,1]
[[],[3],[2,3],[1,2,3]]

scanl は結果の最終要素に最終結果が入る
scanr は結果のに先頭に結果が入る

スキャンを使った例として、次の問題をしてみる
（問）自然数の平方根を小さいものから足していった時、1000を超えるのは何個目？
-}
sqrtSums :: Int
sqrtSums = length (takeWhile (<(1000::Double)) (scanl1 (+) (map (sqrt) [1..]))) + 1
