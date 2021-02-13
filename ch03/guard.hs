-- ガード


-- if 式っぽい感じだけど、複数になればガードの方が可読性が高い
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal.\
                  \ Pffft, Ibet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"


-- 独自の max 関数
max' :: (Ord a) => a -> a -> a
max' a b
  | a > b     = a
  | otherwise = b


-- 独自の compare  （中置記法は関数定義でも使える）
compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
  | a > b     = GT
  | a < b     = LT
  | otherwise = EQ
