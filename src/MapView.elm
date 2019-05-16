module MapView exposing (view)

import Html
import Map
import Svg
import Svg.Attributes exposing (cx, cy, fill, height, r, transform, viewBox, width, x, y)


scale =
    70


transformCoords ( u, v ) =
    ( (toFloat u - toFloat v * 0.5) * scale
    , toFloat v * scale * sqrt 3 * 0.5
    )


viewLocation layout ( u, v ) =
    let
        ( px, py ) =
            transformCoords ( u, v )

        ( sx, sy ) =
            ( String.fromFloat px, String.fromFloat py )

        rad =
            String.fromFloat (toFloat scale / 2.0 - 1.0)

        colorString =
            if List.any ((==) ( u, v )) layout.homes then
                "green"

            else if ( u, v ) == layout.mecatol then
                "gray"

            else
                "blue"
    in
    Svg.g
        [ transform <| "translate(" ++ sx ++ "," ++ sy ++ ")" ]
        [ Svg.circle
            [ r rad, fill colorString ]
            []
        , Svg.text_
            [ x "-10", y "5", fill "white" ]
            [ Svg.text <| String.fromInt u ++ "," ++ String.fromInt v ]
        ]


view layout =
    Svg.svg
        [ viewBox "-200 -100 600 500", width "600", height "600" ]
        (List.map (viewLocation layout) layout.locations)
