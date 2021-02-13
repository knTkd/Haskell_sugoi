-- 型クラス (長くなったので分けたやつ)

{-
Enum 型クラス
順番に並んだ型を列挙できる型。その利点はレンジの中で使えること
['a' .. 'e']  ->  "abcde"
[LT .. GT]    ->  [LT, EQ, GT]
[3 .. 5]      ->  [3, 4, 5]

Enum のインスタンスの型には後者関数succ と前者関数pred も定義されている
列挙できるのはこのため
succ 'B'  ->  'C'


Bounded 型クラス
この型クラスのインスタンスは上限と下限を持つ。これらはminBound、maxBound関数で調べることができる
minBound :: Int  ->  -9223372036854775808
maxBound :: Char ->  '\1114111'
maxBound :: Bool ->  True

この２つの関数は (Bounded a) => a という型を持っている
これは型クラス制約でBoundedのインスタンスでなければならないが、引数は存在しないとなっている。これは正しく、minBounded、maxBoundedは定数である。定数を::を使ってそれぞれの型に注釈しているに過ぎない。
複数の値を持っているということになる。
これを 多相定数 と言う


Num 型クラス
数の型クラス。あらゆる数も多相定数として表現されている。
これによりNum型クラスの任意のインスタンス（Int, Integer, Float, Double）として振る舞うことができる
20 :: Int     ->  20
20 :: Integer ->  20
20 :: Double  ->  20.0

例えば演算子*の型にも出てる
:t (*)
(*) :: (Num a) => a -> a -> a
この型制約により(5 :: Int) * (3 :: Integer) はエラーとなる


Floating 型クラス
Float と Double が含まれる
引数と返り値がFloating型クラスのインスタンスであるような関数はその結果を少数で表現できないと意味がない。sin cos sqrtなど、これらに使われる


Integral 型クラス
整数全体の型クラス。Int と Integer が含まれる
fromIntegral :: (Num b, Integral a) => a -> b
という関数が便利

例えば
let a = 3 :: Int があるとき、
a * pi   はエラーとなる（aがIntegralなので）
これを
fromIntegral a * pi   とすると、aがNum型クラスに変換されるのでエラーが出ない

fromIntegral (length "apple") + 3.2
などの計算のときにも（length はIntなので）
-}


-- 一つの型はいくつもの型クラスのインスタンスとなることもできる
-- 逆もまた然り（一つの型クラスはいくつもの型をインスタンスとして持てる）
