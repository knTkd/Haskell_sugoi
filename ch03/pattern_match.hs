{-# OPTIONS -Wall -Werror #-}
--       パターンマッチ


-- パターンが上から順に試される
lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!!"
lucky _ = "sorry, you're out of luck, pal!"

{-
-- 小文字ではじまっているかどうか (関係ないけど、なんとなく確かめたくなった)
startWithLower :: String -> Bool
startWithLower st = elem (head st) ['a'..'z']
-}

-- 1から3はそのまま、それ以外を区別する関数
sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe _ = "Not between 1 and 3" -- sayMe x = としていたけど、一行目のエラーチェックを使うと、x をつかってないけど？みたいに教えてくれる _ にしたら消えた 便利

sayMe' :: Int -> [Char]
sayMe' x = if elem x [1..3] then show x else "Not between 1 and 3"

-- 階乗
factorial :: Integer -> Integer
factorial x = product [1..x]

-- を、再帰で
factorial' :: Integer -> Integer
factorial' 0 = 1
factorial' x = x * factorial' (x - 1)

-- 漏れてると、non-exhaustive patterns （パターンが網羅的でない）というエラーが出る
-- パターンを作るときには、全てに合致するパターンを最後に入れるべき


-------------------- タプルのパターンマッチ --------------------

-- 二次元のベクトルを受け取りそれらを足し合わせる関数
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)

-- もっと読みやすい書き方
addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


-- トリプルの各要素を取り出したい
first' :: (a, b, c) -> a
first' (a, _, _) = a

second' :: (a, b, c) -> b
second' (_, b, _) = b

third' :: (a, b, c) -> c
third' (_, _, c) = c


--    ペアのリストをもらって、合計のリストを作る関数
-- ペアのリスト
pair_list :: [(Integer, Integer)]
pair_list = [(3, 4), (2, 0), (1, 3)]  -- >  [7, 2, 4]

-- 関数  このようにリスト内包表記でもパターンマッチが使える
addPairs :: (Num a) => [(a, a)] -> [a]
addPairs xs = [a+b | (a, b) <- xs]


-- 独自のhead 関数
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
-- 複数の変数に束縛したいときは丸括弧で囲まなければシンタックスエラー
head' (x:_) = x  -- [1, 2, 3] は 1:2:3:[] の構文糖衣である x:xsでリストにマッチ

-- error関数は文字列を引数にとり、ランタイムエラーを生成する


-- 長さが１、２、またはそれ以上のときで処理を変える関数
tell :: [a] -> [Char]
tell [] = "Empty :D"
tell (_:[]) = "One!"
tell (_:_:[]) = "Two!!"
tell (_:_:_) = "So long ..."


-- asパターン
-- パターンマッチもさせつつ、元の引数も使いたいときに用いる
firstLetter :: [Char] -> [Char]
firstLetter [] = "Nothing"
-- 元の文字列全体も使いたい
firstLetter st@(x:_) = "The first letter of " ++ st ++ " is " ++ [x]
