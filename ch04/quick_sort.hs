{-# OPTIONS -Wall -Werror #-}


-----------------   クイックソート！   -----------------

{-
最初の要素をピボットとする
ピボット以下の要素からなるリスト、より大きい要素からなるリストを作る
その２つのリストをまた quicksort 関数に入れる
それをくっつける
-}


-- 自分の実装
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [xss | xss <- xs, xss < x]
                   ++ [x]
                   ++ quicksort [xss | xss <- xs, xss >= x]

--本の実装
-- let 束縛を使ってわかりやすい名前を付けている
quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
  let smallOrEqual = [a | a <- xs, a <= x]
      larger       = [a | a <- xs, a > x]
  in quicksort' smallOrEqual ++ [x] ++ quicksort' larger
  
