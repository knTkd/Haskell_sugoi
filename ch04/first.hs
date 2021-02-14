{-# OPTIONS -Wall -Werror #-}

-- 最高に最高！

{-
Haskell で再帰が重要な理由
 -> 求めるものが何であるかを宣言して計算を行うから（命令型言語はどうやってするかを指定する）
    Haskell の目的は計算を実行するステップを示すのではなく、欲しい結果が何であるかを直接定義すること
-}


-- リストの中の一番ビッグな値を返す
maximum' :: (Ord a) => [a] -> a
maximum' []     = error "Empty list"
maximum' (x:[]) = x
maximum' (x:xs) = max x (maximum' xs) -- head を x , tail を xs と呼んでいる

