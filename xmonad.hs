-- ALFA'S XMONAD CONFIG 2020
-- ----------------------------------- --
--  Modules                            --
-- ----------------------------------- --

-- Custom Modules
import Modules.TreeSelect
import Modules.WebSearch
import qualified Modules.Keybindings as KB
import Modules.Variables
import Modules.Prompt
import Modules.NamedScratchpad
import Modules.Layouts

-- Base Modules
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

-- Xfce Integration
import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops

-- Data Modules
import Data.Char
import Data.List
import Data.Monoid
import Data.Maybe
import qualified Data.Map as M

-- Util Modules
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad

-- Actions

-- Hooks
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WorkspaceHistory

-- Layouts
import XMonad.Layout.Spacing

-- ----------------------------------- --
--  Hooks                              --
-- ----------------------------------- --

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
    [
    ] <+> namedScratchpadManageHook myScratchpads

myLogHook = ewmhDesktopsLogHook

myStartupHook = do
    ewmhDesktopsStartup

-- ----------------------------------- --
--  Main                               --
-- ----------------------------------- --

main :: IO ()
main = do 
    xmonad $ docks xfceConfig
              { manageHook = ( isFullscreen --> doFullFloat )
                  <+> myManageHook
                  <+> manageDocks
                  
              , logHook    = ewmhDesktopsLogHook
              , layoutHook = avoidStruts
                  $ spacing mySpacing
                  $ myLayout

              , handleEventHook = ewmhDesktopsEventHook
              , startupHook =
                  ewmhDesktopsStartup
                  <+> spawn "picom -b"
              , modMask    = myModMask

              , terminal           = myTerminal
              , focusFollowsMouse  = myFocusFollowsMouse
              , clickJustFocuses   = myClickJustFocuses
              , borderWidth        = myBorderWidth
              , normalBorderColor  = myNormalBorderColor
              , focusedBorderColor = myFocusedBorderColor
              }
              `additionalKeysP` KB.myKeys
