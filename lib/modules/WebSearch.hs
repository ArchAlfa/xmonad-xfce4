-- ----------------------------------- --
--  Web Search                         --
-- ----------------------------------- --

module Modules.WebSearch where

-- MODULES
import XMonad
import qualified XMonad.Actions.Search as S

-- BROWSER
braveBrowser :: S.Browser
braveBrowser = "/usr/bin/brave"

-- ENGINES
archwiki, duckduckgo, google, youtube, everipedia :: S.SearchEngine

archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="
duckduckgo = S.searchEngine "duckduckgo" "https://duckduckgo.com/?q="
google = S.searchEngine "google" "http://www.google.com/search?q="
youtube = S.searchEngine "youtube" "https://www.youtube.com/results?search_query="
everipedia = S.searchEngine "everipedia" "https://everipedia.org/search?input="

-- KEYBINDINGS
searchList :: [(String, S.SearchEngine)]
searchList = 
    [ ("a", archwiki)
    , ("d", duckduckgo)
    , ("g", google)
    , ("y", youtube)
    , ("w", everipedia)
    ]