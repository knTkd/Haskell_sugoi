{-# OPTIONS -Wall -Werror #-}

-- モジュール 及びモジュールをインポートする

{-
Haskell のモジュールはいくつかの関数や型、型クラスなどを定義したファイル

Haskell の標準ライブラリは複数のモジュールに分割されていて、それぞれのモジュールに含まれる関数と型には何らかの関係が有り、共通の目的で結びついている
リストを操作するモジュール、並列プログラミングのためのモジュール、複素数を扱うためのモジュールなど...

これまでの章で使ってきたすべての関数、型、型クラスはデフォルトでインポートされる Prelude というモジュールの一部だった
-}

-- モジュールをインポートする
-- Data.List はリストに対する関数をエクスポートしている
import Data.List       -- GHCi からインポートするには :m + Data.List Data.Map Data.Set

-- リストに一意な要素がいくつあるかを数える関数
numUniques :: (Eq a) => [a] -> Int
-- nub はリストから重複する要素を取り除く関数で、Data.Listがエクスポートする関数の１つ
numUniques = length . nub

{-
探している関数がどこにあるのか知りたいときは Hoogle (http://www.haskell.org/hoogle/)を使うと便利


-}

import Data.List (nub, sort)  -- nub と sort 関数だけをインポート

import Data.List hiding (nub) -- nub 関数を除くすべての関数をインポート

{-
名前の競合を避ける

・修飾付きインポート
Data.Mapモジュールを例に見ると、filter や null のようなPrelude にある関数と同じ名前の関数をたくさんエクスポートしてる
Data.Mapをインポートして filter を呼び出すと、Haskellはどちらの関数を使えばいいかわからなくなってしまう
これを解決するためには    -}
import qualified Data.Map as M
{-
とする。この状態だと、M.filterで参照することができる
-}
