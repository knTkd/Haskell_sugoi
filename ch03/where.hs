-- where キーワード

bmiTell :: Double -> Double -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "underweight"
  | weight / height ^ 2 <= 25.0 = "normal"
  | weight / height ^ 2 <= 30.0 = "fat!"
  | otherwise                   = "whale, congratulations!"

{-
上の関数だとなんども同じ計算をしている。
それを where を使うと...
-}

bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "normal"
  | bmi <= fat    = "fat!"
  | otherwise   = "whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0


-- 可読性もあがるし、変更する際も一箇所で済む また、計算速度も上がる
-- where のインデントは揃える

{-
where のスコープ

where で定義した変数はその関数の最後の本体からしか見えない

例えば...

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet name   = badGreeging  ++ " " ++ name
  where niceGreeting = "Hello!"
        badGreeging  = "Who?"

この関数は間違っている。where で定義された２つの挨拶はgreet nameでマッチしたパターンからしか
見えないので、greet "Juan" でマッチした際に niceGreeting が未定義となっている
-}


-- パターンマッチ と where

{-
where の中でのパターンマッチ


上の bmiTell での where は、

  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

のように書いても問題ない（Python のアンパックのように）
-}


-- ファーストネームとラストネームを受け取ってイニシャルを返す関数
initials :: String -> String -> String
initials firstname lastname = [f] ++ "." ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname
