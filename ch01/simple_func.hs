
-- 赤ちゃんの最初の関数

{-
Haskellでの関数の構文は
  関数名 引数 = 処理
となる

インタープリンタでこのファイルを読み込むときは
  :l simple_func
とする
-}

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y


{-
Haskellでは if 式には else 節が必須

Haskellプログラムは関数の集まりなので、すべての関数は何らかの値を
返す必要がある。

ifは必ず値を返す式であって、文ではない！
-}

doubleSmallNumber x = if x > 100
		  then x
		  else x*2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

{-
Haskellでは関数が一つも引数を取らないとき、これを定義とか名前とか呼ぶ
-}

conanO'Brien = "It's a-me, Conan O'Brien!"
