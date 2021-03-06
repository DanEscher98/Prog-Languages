module Main where
import           Bindings
import           Data.IORef
import           Graphics.UI.GLUT

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    initialDisplayMode $= [WithDepthBuffer, DoubleBuffered]
    _window <- createWindow "Hello World"
    reshapeCallback $= Just reshape
    depthFunc $= Just Less -- the comparison function
    angle <- newIORef 0
    delta <- newIORef 0.1
    pos <- newIORef (0, 0)
    keyboardMouseCallback $= Just (keyboardMouse delta pos)
    idleCallback $= Just (idle angle delta)
    displayCallback $= display angle pos
    mainLoop

