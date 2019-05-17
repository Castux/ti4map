module State exposing (State, init, update, view)

import Html
import Map
import MapView
import Message
import System


type alias State =
    { hover : Maybe Int
    , selected : Maybe Int
    , map : Map.Map
    }


init =
    { hover = Nothing
    , selected = Nothing
    , map = Map.makeBasicMap Map.standardLayout
    }


update msg state =
    case msg of
        Message.OnSystemHover index ->
            { state
                | hover =
                    if index > 0 then
                        Just index

                    else
                        Nothing
            }

        Message.OnSystemHoverOut ->
            { state | hover = Nothing }

        Message.OnSystemClicked index ->
            case state.selected of
                Just s ->
                    { state | map = Map.swapTiles state.map s index, selected = Nothing, hover = Nothing }

                Nothing ->
                    { state | selected = Just index, hover = Nothing }


view : State -> Html.Html Message.Message
view state =
    Html.div
        []
        [ MapView.view state.map.tiles state.hover state.selected
        , MapView.viewUnusedSystems state.map.unusedSystems state.hover state.selected
        ]
