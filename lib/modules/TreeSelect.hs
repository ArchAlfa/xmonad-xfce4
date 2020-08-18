-- ----------------------------------- --
--  Tree Select                        --
-- ----------------------------------- --

module Modules.TreeSelect where

-- MODULES
import XMonad
import qualified Modules.Variables as V

import Data.Tree
import XMonad.Actions.TreeSelect as TS
import XMonad.Hooks.WorkspaceHistory
import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- KEYBINDINGS
tsDefaultNavigation = M.fromList
    [ ((0, xK_Escape), TS.cancel)
    , ((0, xK_Return), TS.select)
    , ((0, xK_space),  TS.select)
    , ((0, xK_Up),     TS.movePrev)
    , ((0, xK_Down),   TS.moveNext)
    , ((0, xK_Left),   TS.moveParent)
    , ((0, xK_Right),  TS.moveChild)
    , ((0, xK_k),      TS.movePrev)
    , ((0, xK_j),      TS.moveNext)
    , ((0, xK_h),      TS.moveParent)
    , ((0, xK_l),      TS.moveChild)
    , ((0, xK_o),      TS.moveHistBack)
    , ((0, xK_i),      TS.moveHistForward)
    ]

-- CONFIG
tsDefaultConfig :: TS.TSConfig a
tsDefaultConfig = TS.TSConfig
    { TS.ts_hidechildren = True
    , TS.ts_background   = 0xdd292d3e
    , TS.ts_font         = V.myFont
    , TS.ts_node         = (0xffd0d0d0, 0xff202331)
    , TS.ts_nodealt      = (0xffd0d0d0, 0xff292d3e)
    , TS.ts_highlight    = (0xffffffff, 0xff755999)
    , TS.ts_extra        = 0xffd0d0d0
    , TS.ts_node_width   = 200
    , TS.ts_node_height  = 30
    , TS.ts_originX      = 0

    , TS.ts_originY      = 0
    , TS.ts_indent       = 80
    , TS.ts_navigate     = tsDefaultNavigation
    }

-- MENU
treeselectAction :: TS.TSConfig (X ()) -> X ()
treeselectAction a = TS.treeselectAction a
    [ Node (TS.TSNode "Shutdown" "" (spawn "shutdown now")) []
    , Node (TS.TSNode "Reboot" "" (spawn "reboot")) []
    , Node (TS.TSNode "Volume" "Sets the volume using amixer" (return ()))
        [ Node (TS.TSNode "100%" "" (spawn "amixer set Master 100% unmute")) []
        , Node (TS.TSNode "75%"  "" (spawn "amixer set Master 75% unmute"))  []
        , Node (TS.TSNode "50%"  "" (spawn "amixer set Master 50% unmute"))  []
        , Node (TS.TSNode "25%"  "" (spawn "amixer set Master 25% unmute"))  []
        , Node (TS.TSNode "0%"   "" (spawn "amixer set Master 0% unmute"))   []
        ]
    , Node (TS.TSNode "Brightness" "Changes the brightness using xrandr" (return()))
        [ Node (TS.TSNode "Sunny"   ""  (spawn "xrandr --output eDP-1 --brightness 1.4")) []
        , Node (TS.TSNode "Bright"  ""  (spawn "xrandr --output eDP-1 --brightness 1.2")) []
        , Node (TS.TSNode "Normal"  ""  (spawn "xrandr --output eDP-1 --brightness 1.0")) []
        , Node (TS.TSNode "Low"     ""  (spawn "xrandr --output eDP-1 --brightness 0.8")) []
        , Node (TS.TSNode "Minimal" ""  (spawn "xrandr --output eDP-1 --brightness 0.6")) []
        ]
    , Node (TS.TSNode "Start Picom" "" (spawn "picom &")) []
    , Node (TS.TSNode "Stop  Picom" "" (spawn "killall picom")) []
    
    , Node (TS.TSNode "Xkcd" "Some fun" (spawn "~/.sh/xkcd.sh")) []
    , Node (TS.TSNode "Webcam" "" (spawn "~/.sh/webcam.sh")) []
    , Node (TS.TSNode "Screenshot" "" (spawn "~/.sh/screenshot.sh")) []
    ]
