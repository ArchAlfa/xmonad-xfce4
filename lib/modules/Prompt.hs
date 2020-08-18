-- ----------------------------------- --
--  Xmonad prompt                      --
-- ----------------------------------- --

module Modules.Prompt where

-- MODULES
import XMonad
import qualified Modules.Variables as V

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.XMonad
import XMonad.Prompt.Man
import XMonad.Prompt.Pass
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Ssh
import Control.Arrow (first)

alfaXPConfig :: XPConfig
alfaXPConfig = def
      { font                = V.myFont 
      , bgColor             = V.myBackgroundColor
      , fgColor             = V.myForegroundColor
      , bgHLight            = "#1B1D24"
      , fgHLight            = "#000000"
      , borderColor         = V.myNormalBorderColor
      , position            = Top
      , height              = 40
      , historySize         = 0
      , defaultText         = []
      , showCompletionOnTab = True
      --, searchPredicate     = S.isPrefixOf
      , alwaysHighlight     = False
      , maxComplRows        = Nothing
      }

alfaXPConfig' :: XPConfig
alfaXPConfig' = alfaXPConfig
    { autoComplete = Nothing } 
