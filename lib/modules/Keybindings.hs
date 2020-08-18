-- ----------------------------------- --
--  Keybindings                        --
-- ----------------------------------- --

module Modules.Keybindings where

-- MODULES
import Modules.TreeSelect
import qualified Modules.WebSearch as WS
import qualified Modules.Variables as V
import Modules.Prompt
import Modules.NamedScratchpad

import XMonad
import System.Exit
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import qualified XMonad.Actions.Search as S
import XMonad.Util.NamedScratchpad
import qualified XMonad.Actions.CycleWS as CS

-- CONFIG
myKeys :: [([Char], X ())]
myKeys =
    -- default keybindings
    [ ("M-<Return>", spawn (V.myTerminal))
    , ("M-k", kill)
    , ("M-<Space>", sendMessage NextLayout)
    , ("M-n", refresh)
    , ("M-<Tab>", windows W.focusDown)
    -- , ("M-i", windows W.focusDown)
    -- , ("M-k", windows W.focusUp )
    , ("M-m", windows W.focusMaster)
    , ("M-S-<Return>", windows W.swapMaster)
    , ("M-S-j", windows W.swapDown)
    , ("M-S-k", windows W.swapUp)
    , ("M-h", sendMessage Shrink)
    , ("M-e", sendMessage Expand)
    , ("M-t", withFocused $ windows . W.sink)
    , ("M-,", sendMessage (IncMasterN 1))
    , ("M-.", sendMessage (IncMasterN (-1)))
    , ("M-S-e", io (exitWith ExitSuccess))
    , ("M-r", spawn "killall xmobar; xmonad --recompile; xmonad --restart")
    
    -- Desplazamiento entre ventanas
    , ("M-<Up>", windows W.focusUp)
    , ("M-<Down>", windows W.focusDown)
    , ("M-S-<Up>", windows W.swapUp)
    , ("M-S-<Down>", windows W.swapDown)

    -- Programs
    , ("M-u", spawn V.myProgramMenu)

    -- CycleWs
    , ("M-l", CS.nextWS)
    , ("M-j", CS.prevWS)
    -- shiftToNext,     shiftToPrev,     nextScreen, prevScreen,
    -- shiftNextScreen, shiftPrevScreen, toggleWS

    -- Prompts
    -- , ("M-o", shellPrompt alfaXPConfig)

    -- Sound with amixer
    , ("M1-<Down>", spawn "amixer set Master 5%- unmute")    
    , ("M1-<Up>", spawn "amixer set Master 5%+ unmute")    

    -- Tree Select
    , ("M1-u", treeselectAction tsDefaultConfig)

    -- Named Scratchpads
    , ("M-S-<Left>", namedScratchpadAction myScratchpads "terminal")
    , ("M-S-<Right>", namedScratchpadAction myScratchpads "webcam")

    -- OnScreen
     -- , ("M-S-<Right>", windows (viewOnScreen 0 "1"))
    ]
    -- Web prompt
    ++ [ ("M-s " ++ k, S.promptSearchBrowser alfaXPConfig' WS.braveBrowser f) | (k,f) <- WS.searchList ]
