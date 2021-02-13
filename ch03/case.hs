{-# OPTIONS -Wall -Werror #-}

-- case 式

{-
case 式という名前が示すとおり、if/else 式や let 式と同じく case も式である
また、case では変数の値に基づいて評価を分岐させるだけではなく、パターンマッチも使える

関数の引数に対するパターンマッチとかなり似ている -> case式の構文糖衣だった！！

例えば、以下の２つのコード片はまったく同じ

head' :: [a] -> a
head' [] = error "No head"
head' (x:_) = x

head' :: [a] -> a
head' xs = case xs of [] -> error "No head"
                      (x:_) -> x

case 式の構文は
case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   ...
となっている。マッチするパターンが見つからなかった場合ランタイムエラー
-}

-- case 式はどこでも使える

describeList :: Show a => [a] -> String -- show のインスタンスである必要がある
describeList xs = "The list is "
                  ++ (case xs of []     -> "Empty!"
                                 (_:[]) -> "Sigleton list"
                                 _     -> "Longer list")
                  ++ " (" ++ (show xs) ++ ")"

-- 関数定義でのパターンマッチは case 式と同じように使えるので、以下のようにもできる
describeList' :: Show a => [a] -> String
describeList' xs = "The List is " ++ what xs ++ show xs
  where what []  = "Empty!"
        what [_] = "Singleton list"
        what _   = "Longer list"
  -- where の中で what を関数として定義

-- 以下のようにも
describeList'' :: Show a => [a] -> String
describeList'' xs = "The List is " ++ what xs ++ show xs
  where what x = case x of []  -> "Empty"  -- ここでもwhat xsのようにするとエラー 調べると上のxsとかぶっていて名前が衝突するかららしい 上のスコープここまであったんや
                           [_] -> "Single!"
                           _   -> "long"
