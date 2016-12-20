import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.Workscreen
import XMonad.Layout.Fullscreen 
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ThreeColumns
import Data.List



myTerminal = "/usr/bin/terminator"

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaultConfig {
    manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = avoidStruts $ layoutHook defaultConfig
  , modMask = mod4Mask
  , logHook = dynamicLogWithPP $ xmobarPP
    	      { ppOutput = hPutStrLn xmproc
	      , ppCurrent = xmobarColor "#8be9fd" "" . pad
              , ppTitle = xmobarColor "#8be9fd" "" . wrap "[" "]"
              }
   , terminal = "terminator"
  }



