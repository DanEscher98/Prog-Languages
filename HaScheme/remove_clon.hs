module RemoveClon where

removeClon :: [Int] -> [Int]
removeClon [] = []
removeClon [x] = [x]
removeClon xs = removeClon (deleteNElem (if twoEqual xs
                                            then nEqualHead xs 
                                            else 0) xs)

nEqualHead :: [Int] -> Int
nEqualHead [] = 0
nEqualHead (x:xs)
    | x == head xs  = 1 + nEqualHead xs
    | otherwise     = 1

twoEqual :: [Int] -> Bool
twoEqual []     = False
twoEqual [x]    = False
twoEqual (x:xs) = x == head xs

deleteNElem :: Int -> [Int] -> [Int]
deleteNElem _ [] = []
deleteNElem 0 xs = xs
deleteNElem n (x:xs) = deleteNElem (pred n) xs

interseccion :: [Int] -> [Int] -> [Int]
interseccion [] ys = []
interseccion (x:xs) ys
    | x `elem` ys = x : interseccion xs ys
    | otherwise = interseccion xs ys
