module Main exposing (init, main, update)

import Browser
import Html
import Html.Events
import Map
import MapView


type Message
    = Click


init =
    Map.makeBasicMap Map.standardLayout


update msg state =
    state


view state =
    Html.div
        []
        [ MapView.view state.tiles
        , MapView.viewUnusedSystems state.unusedSystems
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
