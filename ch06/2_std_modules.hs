{-# OPTIONS -Wall -Werror #-}

-- 標準モジュールの関数で問題を解く

{- 文字列の中の単語を数える
(例) "hey these are the words" -> "hey":1  "these":1  "are":1  "the":1  "words":1
-}
import qualified Data.List as L
import qualified Data.Char as C

-- wordsで単語ごとのリストにして、sortで並び替え、groupで隣接する要素で同じものをまとめる
wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . L.group . L.sort . L.words


{- haystack(干し草の山) から needle(針)を探す
 ２つのリストを受け取り、１つ目のリストが２つ目のリストのどこかに含まれているかを調べる
(例) [3,4] [1,2,3,4,5]  ->  True!!
-}

-- tailsを使いtailを繰り返し適用させ、isPrefixOfでneedle始まりのリストかどうかを調べ、anyで１つでもその述語を満たすかを返す
isIn :: (Eq a) => [a] -> [a] -> Bool
isIn needle haystack = any (L.isPrefixOf needle) $ L.tails haystack


{- シーザー暗号サラダ
数と文字列を受け取って、それをシーザー暗号で暗号化する関数
-}
-- 自分の実装 汚いな...
fn :: Int -> String -> String
fn n st = map (cc n) st
  where azlen = (C.ord 'z') - (C.ord 'a') + 1
        cc a c = C.chr $ (C.ord 'a') + (mod ((C.ord c) + a - (C.ord 'a')) azlen)

-- 本での実装
-- C.ordでchar->Intにして、それにoffsetやshiftを足し引きして、C.chrでInt->Charに戻してる
encode :: Int -> String -> String
encode offset msg = map (C.chr . (+ offset) . C.ord) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg


{-
前章でみたように、foldlは一番底までいってから初めて計算を始める
そこに行くまでどうするかというと、計算をすべてメモリ上に保持し続ける
よって、 foldl (+) 0 $ replicate 10000000 1 などはスタックオーバーフローを引き起こす

ここで、計算を再帰的に行わず、逐次行っていく関数が
Data.List.foldl' である（Data.List.foldl1'もある）
-}

{-
各桁の数が40になる最初の自然数をもとめよ
-}

-- 自分の実装
rec :: Int -> Int
rec 0 = 0
rec n = mod n 10 + (rec (div n 10))

solve :: Bool -> Int -> Int  -- solve False 0で使う予定
solve found n
  | found     = n
  | otherwise = if rec (n + 1) == 40 then solve True (n + 1) else solve False (n + 1)

-- 本での実装
-- showでInt->Stringにし、その中のcharに対しData.Char.digitToIntを使いchar->intにする
digitSum :: Int -> Int
digitSum = sum . map C.digitToInt . show

-- Data.List.find  述語関数とリストを引数にとり、リストの中で条件に合致する最初の要素を返す
-- 失敗するかもしれない（一個も合致する要素がない場合もある）ので、返り値はMaybe型の値
firstTo40 :: Maybe Int
firstTo40 = L.find (\x -> digitSum x == 40) [1..]
