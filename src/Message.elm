module Message exposing (Message(..))


type Message
    = OnSystemHover Int
    | OnSystemHoverOut
    | OnSystemClicked Int
