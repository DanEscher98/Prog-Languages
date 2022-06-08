

sum x = x * 



other x = x * 2
{-
    This is a program to compute the number
    tee | & > >>
    /dev/tty /dev/null

    To pipe both stdout and stderr  |&
    Redirect stdin and stdout       cmd < file > output
    Redirect stdout and stderr      1> output.log 2> debug.log
    Redirect te stderr              2>

-}

-- 

conditioncondition

map2D :: (a -> b) -> [[a]] -> [[b]]
map2D   =                          map . map
{-
map2D   =        (\f1 xs -> map f1 xs) . (\f2 ys -> map f2 ys)
map2D   = (\f -> (\f1 xs -> map f1 xs)) ((\fs ys -> map f2 ys) f)
map2D f =        (\f1 xs -> map f1 xs)  ((\fs ys -> map f2 ys) f)
map2D f =        (\f1 xs -> map f1 xs)      (\ys -> map  f ys)
map2D f =           (\xs -> map (\ys -> map f ys) xs)
map2D f xs =                map (\ys -> map f ys) xs
-}
