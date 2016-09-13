-- data type is similar to case class in Scala
data Shape = Rectangle Float Float Float Float | Circle Float Float Float

-- Value constructor such as Rectancle should not be used in function declaration
surface :: Shape -> Float 

-- Value constructor should be used in pattern match. Here function definition also is similar in Clojure.
surface (Circle _ _ r) = pi * r ^ 2 

-- dollar usage?
surface (Rectangle s0 s1 t0 t1) = (abs $ t0 - s0) * (abs $ t1 - s1)
