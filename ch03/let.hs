{-# OPTIONS -Wall -Werror #-}

-- let It Be

-- 円柱の高さと半径をもらって、その表面積を返す
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h  -- 横の部分 伸ばして計算するみたいなイメージ
      topArea  = pi * r * r      -- 円の面積
  in  sideArea + topArea * 2

{-
let の特性
let 式は let bindings in expression という形を取るらしい

let 式が作る束縛は局所的でガード間で共有されない
束縛を行う他の構文と同じく、let 式でもパターンマッチが使える

・本質
let 式はその名の通り「式」である。（whereは違う）
"boo!"、3 + 5、[1, 2, 3] たちと同様、式であるということ
何かが「式である」というのは、それが値を持つということ

以上から let 式は次のようにコード中のほとんどどんな場所でも使えるということ
  ghci> 4 * (let a = 9 in a + 1) + 2
  42

let 式を使わない理由たち
let 式は「式」であり、そのスコープに局所的 -> ガードをまたいで使えない！！
関数の前ではなく後ろで部品を定義するのが良いから where を使いたい！！ 可読性は高い
-}


------------------- let 式の便利な使い方 -------------------

-- ローカルスコープに関数を作るのに使える
squares :: (Integer, Integer, Integer)
squares = let square x = x * x in (square 5, square 3, square 2)
  -- (25, 9, 4) となる
  -- これは、ローカルなスコープに square 関数を定義している


-- 複数の変数を一行で束縛したいときに便利(; で区切ることができる)
mypair :: (Integer, String)
mypair = (let a = 100; b = 200; c = 300 in a*b*c,
          let foo="Hey"; bar="there!" in foo ++ " " ++ bar)

-- let 式とパターンマッチがあれば、タプルを要素に分解できてそれぞれ名前に束縛できる
sumTriple :: Integer
sumTriple = let (a, b, c) = (1, 2, 3) in a+b+c

-- リスト内包表記での、変数束縛のための let
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ (2 :: Integer)]
  -- (体重, 身長) の要素からなるリストを受け取って、各 bmi のリストを返す
  -- let のおかげで bmi という変数を使うことができる
  -- もし let を使わなかったら [w / h ^ 2 | (w, h) <- xs] となってる
  ----------------------------------------------------------------------------------
  -- 述語のように使ってるけど、リストをフィルタするわけじゃなく、名前を束縛してるだけ
  ----------------------------------------------------------------------------------

  -- これを、計算したbmiのうち25を超えているものだけのリストを返したいとなった時、
calcBmis' :: [(Double, Double)] -> [Double]
  -- let を使わなかった場合
--calcBmis' xs = [w / h ^ 2 | (w, h) <- xs, w / h ^ 2 > 25.0]
  -- let を使った場合
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ (2 :: Int), bmi > 25.0]
  -- let を使った場合だと計算が一箇所

  -- 上の (w, h) <- xs の部分をジェネレータと呼ぶ。
  -- let の束縛よりも前に定義されているので、変数 bmi はジェネレータからは参照できない
  

{-
GHCi で直接関数や定数を定義するときは、let 式の in の部分を省略できる
省略した場合、定義した名前はそれ以降の対話的なセッション全体から見えるようになる
ghci> let zoot x y z = x * y + z
ghci> zoot 3 9 2
29
ghci> let boot x y z = x * y + z in boot 3 4 2
14
ghci> boot
<interactive>:1:0: Not in scope 'boot'

２つめのletはinパートを含んでいるので、それ自体が値を表す式である。
それをただ表示しただけで、関数が定義されているわけではない
-}
