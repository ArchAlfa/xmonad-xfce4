-- ----------------------------------- --
--  Layouts                            --
-- ----------------------------------- --

module Modules.Layouts where

-- MODULES
import XMonad
import qualified Modules.Variables as V

-- HOOKS
import XMonad.Hooks.ManageDocks

-- LAYOUTS

import XMonad.Layout.Tabbed
import XMonad.Layout.Simplest
import XMonad.Layout.GridVariants
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns

-- LAYOUT MODIFIERS

-- import XMonad.Layout.ShowWName
-- import qualified XMonad.Layout.Gaps as G
import XMonad.Layout.WindowArranger
import qualified XMonad.Layout.ToggleLayouts as T
import qualified XMonad.Layout.MultiToggle as MT
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Decoration
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

-- LIST -----------------------------------------------------------------------

tall =
    renamed [Replace "tall"]
    $ limitWindows 12
    $ ResizableTall 1 (3/100) (1/2) []

magnify =
    renamed [Replace "magnify"]
    $ magnifier
    $ limitWindows 12
    $ ResizableTall 1 (3/100) (1/2) []

monocle =
    renamed [Replace "monocle"]
    $ limitWindows 20 Full

grid =
    renamed [Replace "grid"]
    $ limitWindows 12
    $ mkToggle (single MIRROR)
    $ Grid (16/10)

spirals =
    renamed [Replace "spirals"]
    $ spiral (6/7)

threeCol =
    renamed [Replace "threeCol"]
    $ limitWindows 7
    $ ThreeCol 1 (3/100) (1/2)

threeRow =
    renamed [Replace "threeRow"]
    $ limitWindows 7
    $ Mirror
    $ ThreeCol 1 (3/100) (1/2)


-- CONFIG ---------------------------------------------------------------------

myLayout = avoidStruts
    $ windowArrange 
    $ mkToggle (NBFULL ?? NOBORDERS ?? EOT)
    $ myDefaultLayout
    where myDefaultLayout = tall ||| Full ||| threeCol ||| threeRow ||| grid
