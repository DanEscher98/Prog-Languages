fixpoint :: Eq a => (a -> a) -> a -> a
fixpoint f x
    | x == fx = fx
    | otherwise = fixpoint f fx
    where fx = f x

mySqrt :: Double -> Double
mySqrt n = fixpoint (\x -> (x + n/x) / 2) 1

main :: IO ()
main = print (mySqrt 144)
