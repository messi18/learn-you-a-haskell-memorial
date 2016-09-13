module Objects(
Point(..),
Shape(..),
Person(..),
surface,
nudge,
baseCircle,
baseRectangle
) where


    -- data type is similar to case class in Scala
    data Shape = Rectangle Point Point | Circle Point Float deriving (Show)

    -- Value constructor such as Rectancle should not be used in function declaration
    surface :: Shape -> Float 

    -- Value constructor should be used in pattern match. Here function definition also is similar in Clojure.
    surface (Circle _ r) = pi * r ^ 2 

    -- dollar usage?
    surface (Rectangle p0 p1) = distance p0 p1


    -- Here Point has to derive Show, otherwise error will be thrown: No instance for (Show Point)
    data Point = Point Float Float deriving (Show)
    distance :: Point -> Point -> Float
    distance (Point x1 y1) (Point x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

    nudge :: Shape -> Float -> Float -> Shape
    nudge (Rectangle (Point x1 y1) (Point x2 y2)) xd yd = Rectangle (Point (x1 + xd) (y1 + yd)) (Point (x2 + xd) (y2 + yd))
    nudge (Circle (Point x y) r) xd yd = Circle (Point (x + xd) (y + yd)) r

    baseCircle :: Float -> Shape
    baseCircle r = Circle (Point 0 0) r 

    baseRectangle :: Float -> Float -> Shape
    baseRectangle width height = Rectangle (Point 0 0) (Point width height)

    -- record syntax is more similar to Scala case class than normal data type
    data Person = Person {firstName :: String, lastName :: String, age :: Int, height :: Float, phoneNumber :: String, flavor :: String} deriving (Show)
    data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)


    -- type constructor
    tellCar :: Car -> String

    -- Pattern match always same as value constructor and record syntax
    tellCar (Car {company=c, model=m, year=y}) = "This " ++ c ++ " " ++ m ++ " is made in " ++ show y

    -- type constructor
    data Vector a = Vector a a a deriving (Show)
    vplus :: (Num t) => Vector t -> Vector t -> Vector t
    (Vector x y z) `vplus` (Vector x1 y1 z1) = Vector (x+x1) (y+y1) (z+z1)

    vmulti :: (Num t) => Vector t -> t -> Vector t
    (Vector x y z) `vmulti` d = Vector (x*d) (y*d) (z*d)

    vscalar :: (Num t) => Vector t -> Vector t -> t
    (Vector x y z) `vscalar` (Vector x1 y1 z1) = x*x1 + y*y1 + z*z1 