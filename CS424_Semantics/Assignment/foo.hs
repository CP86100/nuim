data Tree a = Leaf a | Node [Tree a]
    deriving (Show, Eq)


foo :: Eq a => a -> Tree a -> [Tree a]

val (Leaf x) = x

isNode (Node x) = True
isNode _ = False

foo x (Node []) = []
foo x (Node (y:[])) = []
foo x (Node (y:ys)) = do
    if isNode(y)
    then
        foo x y ++ foo x (Node ys)
    else
        if x == val(y)
        then
            head(ys):foo x (Node ys)
        else
            foo x (Node ys)
