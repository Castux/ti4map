module MapView exposing (view)

import Html
import Map
import Svg
import Svg.Attributes exposing (cx, cy, fill, fillOpacity, height, r, transform, viewBox, width, x, xlinkHref, y)


scale =
    70


transformCoords ( u, v ) =
    ( toFloat u * sqrt 3 * 0.5 * scale
    , (toFloat v + toFloat u * 0.5) * scale
    )


viewTile ( ( u, v ), system ) =
    let
        ( px, py ) =
            transformCoords ( u, v )

        ( sx, sy ) =
            ( String.fromFloat px, String.fromFloat py )

        rad =
            String.fromFloat (toFloat scale / 2.0 - 1.0)

        --        colorString =
        --            if List.any ((==) ( u, v )) layout.homes then
        --                "green"
        --
        --            else if ( u, v ) == layout.mecatol then
        --                "gray"
        --
        --            else
        --                "blue"
        overlap =
            1

        imgWidth =
            2 / sqrt 3 * scale + overlap

        imgHeight =
            scale + overlap
    in
    Svg.g
        [ transform <| "translate(" ++ sx ++ "," ++ sy ++ ")" ]
        [ Svg.image
            [ xlinkHref <| "../img/tile" ++ String.fromInt system.number ++ ".png"
            , width <| String.fromFloat imgWidth
            , height <| String.fromFloat imgHeight
            , x <| String.fromFloat (-imgWidth / 2)
            , y <| String.fromFloat (-imgHeight / 2)
            ]
            []
        ]



-- Svg.text_
--     [ x "-10", y "5", fill "white" ]
--     [ Svg.text <| String.fromInt u ++ "," ++ String.fromInt v ]
-- ]
--        , Svg.circle
--            [ r rad, fill colorString, fillOpacity "0.4" ]
--            []
--
--        ]


view map =
    Svg.svg
        [ viewBox "-250 -250 500 500", width "900", height "900" ]
        (List.map viewTile map)
