-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

-- main = do
--      session <- getEnv "DESKTOP_SESSION"
--      xmonad  $ maybe desktopConfig desktop session

-- desktop "gnome" = gnomeConfig
-- desktop "kde" = kde4Config
-- desktop "xfce" = xfceConfig
-- desktop "xmonad-mate" = gnomeConfig
-- desktop _ = desktopConfig
main = xmonad =<< xmobar def
                {
                    modMask = mod4Mask,
                    terminal    = "alacritty",
                    startupHook = myStartupHook
                }

myStartupHook = spawn "picom"
                >> spawn "feh --bg-fill /home/schmitt/Pictures/cheng-xiao-leaf.jpg"
                >> spawn "dunst"
                >> spawn "autorandr --change"
                >> spawn "xsetroot -cursor_name left_ptr"
