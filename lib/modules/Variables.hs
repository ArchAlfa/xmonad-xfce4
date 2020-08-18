-- ----------------------------------- --
--  Variables                          --
-- ----------------------------------- --

module Modules.Variables where

-- MODULES
import XMonad

myFont :: [Char]
myFont = "xft:Hack:size=18"

myModMask :: KeyMask
myModMask = mod4Mask

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth :: Dimension
myBorderWidth   = 3

myWorkspaces :: [String]
myWorkspaces = ["I","II","III","IV","V","VI","VII","VIII","IX"]

-- COLORS ---------------------------------------------------------------------

myBackgroundColor :: [Char]
myBackgroundColor   = "#1B1D24"

myForegroundColor :: [Char]
myForegroundColor   = "#FFFFFF"

myNormalBorderColor :: [Char]
myNormalBorderColor = "#1B1D24"

myFocusedBorderColor :: [Char]
myFocusedBorderColor= "#28735E"

-- PROGRAMS -------------------------------------------------------------------

myTerminal :: [Char]
myTerminal = "alacritty"

myProgramMenu :: [Char]
myProgramMenu = "xfce4-appfinder"

myProgramMenuTitle :: [Char]
myProgramMenuTitle = "Application Finder"
