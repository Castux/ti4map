module MapView exposing (view, viewUnusedSystems)

import Dict exposing (Dict)
import Html
import Map
import Message
import Svg
import Svg.Attributes exposing (cx, cy, fill, fillOpacity, height, r, transform, viewBox, width, x, xlinkHref, y)
import Svg.Events


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
            , Svg.Events.onMouseOver <| Message.OnHover system.number
            , Svg.Events.onMouseOut <| Message.OnHoverOut
            ]
            []
        ]


viewUnusedSystems systems =
    let
        imgWidth =
            2 / sqrt 3 * scale

        imgHeight =
            toFloat <| scale + 3

        w =
            String.fromFloat <| imgWidth

        h =
            String.fromFloat <| toFloat (List.length systems) * imgHeight

        images =
            systems
                |> List.indexedMap
                    (\i sys ->
                        Svg.image
                            [ xlinkHref <| "../img/tile" ++ String.fromInt sys.number ++ ".png"
                            , width <| String.fromFloat imgWidth
                            , height <| String.fromFloat imgHeight
                            , x <| "0"
                            , y <| String.fromFloat (toFloat i * imgHeight)
                            , Svg.Events.onMouseOver <| Message.OnHover sys.number
                            , Svg.Events.onMouseOut <| Message.OnHoverOut
                            ]
                            []
                    )
    in
    Svg.svg
        [ viewBox <| "0 0 " ++ w ++ " " ++ h, width "100" ]
        images



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
        (Dict.toList map |> List.map viewTile)
