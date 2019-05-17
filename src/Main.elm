module Main exposing (main)

import Browser
import State


main =
    Browser.sandbox
        { init = State.init
        , update = State.update
        , view = State.view
        }
