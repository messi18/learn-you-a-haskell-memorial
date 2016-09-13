-- data type is similar to case class in Scala
data Shape = Rectangle Point Point | Circle Point Float deriving (Show)

-- Value constructor such as Rectancle should not be used in function declaration
surface :: Shape -> Float 

-- Value constructor should be used in pattern match. Here function definition also is similar in Clojure.
surface (Circle _ r) = pi * r ^ 2 

-- dollar usage?
surface (Rectangle p0 p1) = distance p0 p1


data Point = Point Float Float deriving (Show)
distance :: Point -> Point -> Float
distance (Point x1 y1) (Point x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)