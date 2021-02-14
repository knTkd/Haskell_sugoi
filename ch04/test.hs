{-# OPTIONS -Wall -Werror #-}

firster :: [a] -> a
firster [] = error "empty"
firster xs = f
  where (f:_) = xs

