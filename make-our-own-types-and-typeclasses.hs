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
    data Person = Person {firstName :: String, lastName :: String, age :: Int} deriving (Show,Eq,Read)
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

    -- Bounded and Enum type classes
    data Day = Monday | Tuesday | Wednsday | Thursday | Friday | Saturday | Sunday deriving (Show,Eq,Enum,Bounded,Ord,Read)

    -- type synonym. This is same as Scala just to create name alias.
    type PhoneNumber = String
    type Name = String
    type PhoneBook = [(Name,PhoneNumber)]
    phoneBook :: PhoneBook
    phoneBook = [("lance","19089922"),("nn","123987673")]

    inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
    inPhoneBook n p pb = (n,p) `elem` pb


    -- Tree
    data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving(Show,Ord,Eq,Read)
    singleton :: a -> Tree a
    singleton a = Node a EmptyTree EmptyTree

    treeInsert :: (Ord a) => a -> Tree a -> Tree a
    treeInsert x EmptyTree = singleton x
    treeInsert x (Node n l r)
        | x == n = Node x l r
        | x > n = Node n l (treeInsert x r)
        | x < n = Node n (treeInsert x l) r

    treeElem :: (Ord a) => a -> Tree a -> Bool
    treeElem x EmptyTree = False
    treeElem x (Node n l r)
        | x == n = True
        | x < n = treeElem x l
        | x > n = treeElem x r
