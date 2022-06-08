
resta :: Int -> Int -> Int
resta a 0 = a
resta a b = resta a (b-1) - 1

primero :: (a, b) -> a
primero (a, b) = a

segundo :: (a, b) -> b
segundo (a, b) = b

factorial :: Int -> Int
factorial n = product [1..n]

dualtity f = reverse . f . reverse
