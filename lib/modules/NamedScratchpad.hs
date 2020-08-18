-- ----------------------------------- --
--  NamedScratchpad                    --
-- ----------------------------------- --

module Modules.NamedScratchpad where

-- MODULES
import qualified Modules.Variables as V

import XMonad
import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad



-- CONFIG
myScratchpads :: [NamedScratchpad]
myScratchpads =
    [ NS "terminal" "alacritty --config-file ~/.config/alacritty/alacrittyRanger.yml --title ranger -e ranger" (title =? "ranger") manageBorders
    , NS "webcam" "mpv av://v4l2:/dev/video0 --profile=low-latency --untimed" (title =? "video0 - mpv") webcamBorders
    , NS "appmenu" "xfce4-appfinder --collapsed" (title =? "Whisker Menu") menuBorders
    , NS "dmenu" V.myProgramMenu (title =? V.myProgramMenuTitle) launcherBorders
    ]
    where
    role = stringProperty "WM_WINDOW_ROLE"
    manageBorders = customFloating $ W.RationalRect l t w h
        where
        h = 0.9
        w = 0.9
        t = 0.95 -h
        l = 0.95 -w
    webcamBorders = customFloating $W.RationalRect l t w h
        where
        h = 0.3
        w = 0.3
        t = 0.340 -h
        l = 1.00 -w
    menuBorders = customFloating $W.RationalRect l t w h
        where
        h = 0.965
        w = 1
        t = 0.425 -h
        l = 1.00 -w
    launcherBorders = customFloating $W.RationalRect l t w h
        where
        h = 0.260
        w = 0.97
        t = 0.260 -h
        l = 1.00 -w
