-- 明示的な型宣言

{-
:t 値 で型を調べることができる

:t True
:t ("apple", 190)
:t 4 /= 5
-}
{-
引数と返り値の方は -> で区切り、返り値の型は常に宣言の最後に置く

もし最初に型がよくわからない場合は、関数を書いてみてから、:t で調べると良い！！
-}

-- 文字列中の小文字をフィルタする関数に、型宣言を与える
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, elem c ['A'..'Z']]

-- 3つの数をもらい合計を返す関数に型宣言を与える
addThree :: Int -> Int -> Int -> Int
addThree a b c = a + b + c


-- 一般的なHaskellの型

{-
Int
  有界な整数の型で、最大・最小値をもつ
（マシンのワードサイズによって変わるけど、-2^63 <= Int <= 2^63-1)

Integer
  有界でない整数の型（半端ない大きさの数を表せる！）

Float
  単精度浮動小数点数

Double
  倍精度浮動小数点数（数を表すのに使うビット数がFloatの二倍）

Bool
  真理値型 True / False

Char
  Unicode文字を表す

tuple
  一応型だけど、要素の数とその型によって決まるので無限の種類が存在
  空のタプル()も型だということに注意！！
  () のことをユニットと呼ぶ
-}
-- はんぱない大きさの数 （階乗を求める関数）
factorial :: Integer -> Integer
factorial n = product [1..n]

-- 単精度・倍精度の精度の違い (円周を求める関数)
circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
