import Graphics.UI.GLUT

myPoints :: [(GLfloat, GLfloat, GLfloat)]
myPoints = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Hello World"
    displayCallback $= display1
    displayCallback $= display2
    reshapeCallback $= Just reshape
    mainLoop

reshape :: ReshapeCallback
reshape size = do
    viewport $= (Position 0 0, size)
    postRedisplay Nothing

display1 :: DisplayCallback
display1 = do
    clear [ColorBuffer]
    renderPrimitive Triangles $
        mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints


display2 :: DisplayCallback
display2 = do
    let color3f r g b = color $ Color3 r g (b :: GLfloat)
        vertex3f x y z = vertex $ Vertex3 x y (z :: GLfloat)
    clear [ColorBuffer]
    renderPrimitive Quads $ do
        color3f 1 0 0
        vertex3f 0 0 0
        vertex3f 0 0.2 0
        vertex3f 0.2 0.2 0
        vertex3f 0.2 0 0

        color3f 0 1 0
        vertex3f 0 0 0
        vertex3f 0 (-0.2) 0
        vertex3f 0.2 (-0.2) 0
        vertex3f 0.2 0 0

        color3f 0 0 1
        vertex3f 0 0 0
        vertex3f 0 (-0.2) 0
        vertex3f (-0.2) (-0.2) 0
        vertex3f (-0.2) 0 0

        color3f 1 0 1
        vertex3f 0 0 0
        vertex3f 0 0.2 0
        vertex3f (-0.2) 0.2 0
        vertex3f (-0.2) 0 0
    flush
