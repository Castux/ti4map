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
    MapView.view state.tiles


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
