module State exposing (State, init, update, view)

import Html
import Map
import MapView
import Message
import System


type alias State =
    { hover : Maybe Int
    , map : Map.Map
    }


init =
    { hover = Nothing
    , map = Map.makeBasicMap Map.standardLayout
    }


update msg state =
    case msg of
        Message.OnHover index ->
            { state
                | hover =
                    if index > 0 then
                        Just index

                    else
                        Nothing
            }

        Message.OnHoverOut ->
            { state | hover = Nothing }


view state =
    Html.div
        []
        [ MapView.view state.map.tiles
        , MapView.viewUnusedSystems state.map.unusedSystems
        , Html.p []
            [ state.hover |> Maybe.map String.fromInt |> Maybe.withDefault "No hover" |> Html.text
            ]
        ]
