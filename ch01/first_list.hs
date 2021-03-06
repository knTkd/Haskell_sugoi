
-- リスト入門

{-
リストは一様なデータ構造
要素はすべて同じ型でなければならない

  [3, 2, 1] ++ [3, 0, 99]

  "hello" ++ " " ++ "world"

  ['w', 'o'] ++ ['r', 'd']

Haskellでは文字列は文字のリストとして表されている（ｃとかと同じ）
-}

{-
++ では一つ目のリスト（++の左側）を最後まで走査するので、長いリストの最後に追加するときは注意が必要

一方リストの先頭に追加するのはほとんど一瞬で終わる軽い操作（:演算子（cons演算子））

'A':" Small Cat"

4:[2, 3]

-}

{-
[1, 3, 4] は 1:3:4:[] の単なる構文糖衣
[](空のリスト)の先頭に4を追加して、その先頭に3を追加して、その先頭に1を追加している
-}

{-
リストは比較可能（中の要素が比較可能であれば）

[3, 2, 1] > [2, 1, 0]  ->  True

-}