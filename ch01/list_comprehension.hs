-- リスト内包表記
-- リストのフィルタリング、変換、組み合わせを行う方法

{-
-- 変換

1から4までの数を二倍したリスト
[x*2 | x <- [1..4]]
  [2, 4, 6, 8]

7から12までの数を、10に丸めたリスト
[if x < 10 then x else 10 | x <- [7..12]]
  [7, 8, 9, 10, 10, 10]
-}
{-
-- フィルタリング

3の倍数だけを抽出
[x | x <- [1..10], mod x 3 == 0]
  [3, 6, 9]
-}
{-
-- 組み合わせ

[x+y | x <- [1..3], y <- [5..6]]
  [6, 7, 7, 8, 8, 9]
  for x  in [1..3]
    for y in [5..6]  のような感じ 二重ループっぽいかんじになってる
-}

-- 関数にする
-- 数字を文字列に変換するやり方はまだなので"Number"に
fizzbuzz n = [if mod x 15 == 0 then "FizzBuzz!" else if mod x 5 == 0 then "Buzz" else if mod x 3 == 0 then "Fizz" else "Number" | x <- [1..n]]


-- 内包表記をつかった独自のlength関数
length' xs = sum [1 | _ <- xs]


-- 文字列を大文字のみにする関数
removeNonUppercase st = [c | c <- st, elem c ['A'..'Z']]

