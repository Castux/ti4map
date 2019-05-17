module Message exposing (Message(..))

import Map


type Message
    = OnSystemHover Map.SystemIndex
    | OnSystemHoverOut
    | OnSystemClicked Map.SystemIndex
