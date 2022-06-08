

multiplo :: Integral a => a -> a -> Bool
multiplo n x = mod n x == 0

factores :: Int -> [Int]
factores n = [x | x <- [1..n-1], multiplo n x]

perfecto :: Int -> Bool
perfecto n = n == sum (factores n)

abundante :: Int -> Bool
abundante n = n < sum (factores n)

boolFL :: (Int -> Bool) -> Int -> [Int]
boolFL f n = [x | x <- [1..n], f x]

primerAbuNon :: Int
primerAbuNon = head [x | x <- [1..], abundante x, odd x]

puntosDentroCirculo :: Int -> Int
puntosDentroCirculo n = length [(x, y) | x <- [1..m], y <- [1..m], x^2+y^2<n^2]
    where m = truncate (sqrt (fromIntegral n))

factorial :: Integral a => a -> a
factorial n
    | n == 0    = 1
    | otherwise = product [1..n]


aproxE :: (Fractional a, Integral a) => a -> a
aproxE n = sum [ 1 / factorial k | k <- [0..n]]
aproxE' n = [(1+1/m)**m | m <- [1..n]]


resta :: Int -> Int -> Int
resta a 0 = a
resta a n = (resta a (n-1)) - 1

doubleSmallNumber :: Int -> Int
doubleSmallNumber x
    | x > 100   = x
    | otherwise = x*2