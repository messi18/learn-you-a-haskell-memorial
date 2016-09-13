-- data type is similar to case class in Sclala
data Shape = Rectangle Float Float Float Float | Circle Float Float Float
surface :: Shape -> Float -- Value constructor such as Rectancle should not be used in function declaration
surface (Circle _ _ r) = pi * r ^ 2 -- Value constructor should be used in pattern match. Here function definition also is similar in clojure.
surface (Rectangle s0 s1 t0 t1) = (abs $ t0 - s0) * (abs $t1 - s1)
