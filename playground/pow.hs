{-# OPTIONS -Wall -Werror #-}


-- 普通の pow
pow :: Integral a => a -> a -> a
pow _ 0 = 1
pow x n = x * pow x (n - 1)


-- 高速な pow
pow' :: Integral a => a -> a -> a
pow' _ 0 = 1
pow' x n = (if odd n then x else 1) * pow' (x * x) (div n 2)
