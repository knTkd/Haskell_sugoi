{-# OPTIONS -Wall -Werror #-}

-- いくつかの畳み込みの例


-- reverse
reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []
{-
初期アキュムレータを空リストとし、元のリストを先頭から順に見て、アキュムレータの先頭に繋げていく
関数(\acc x -> x : acc)は引数が逆になっていることを除けば単なる:関数
つまり
flip (:) と等価であるということ！！！
そのため以下のようにも書ける

reverse' = foldl (flip (:)) []
-}

-- product
product' :: (Num a) => [a] -> a
product' = foldl (*) 1
{-
アキュムレータ1からはじめ、*関数で左畳み込みをし、各要素をアキュムレータに掛け合わせていく
-}

-- filter
filter' :: (Ord a) => (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []
{-
初期アキュムレータは空で、渡された述語 p で各要素を検査していく
もし p x が真ならアキュムレータの先頭にくっつける
そうでなければ古いアキュムレータをそのまま使い回す
-}

-- last
last' :: [a] -> a
last' = foldl1 (\_ x -> x)
{-
リストの最後の要素を取得するのにfoldl1を使っている
ラムダは、常に現在の値を新しいアキュムレータに置き換えるん引数関数で
-}
