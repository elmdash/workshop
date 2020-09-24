import XMonad
import XMonad.Config.Desktop

myTerminal            = "alacritty"
myFocusFollowsMouse   = False
myClickJustFocuses    = False
myModMask             = mod1Mask

myStartupHook = do
    spawnOnce "$HOME/.config/polybar/launch.sh"

main = xmonad desktopConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = 3
    }
