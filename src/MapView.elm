module MapView exposing (view, viewUnusedSystems)

import Dict exposing (Dict)
import Html
import Map
import Message
import Svg
import Svg.Attributes exposing (cx, cy, fill, fillOpacity, height, r, stroke, strokeWidth, transform, viewBox, width, xlinkHref)
import Svg.Events


scale =
    70


transformCoords ( u, v ) =
    ( toFloat u * sqrt 3 * 0.5 * scale
    , (toFloat v + toFloat u * 0.5) * scale
    )


makeSystemImage index w h x y =
    Svg.image
        [ xlinkHref <| "../img/tile" ++ String.fromInt index ++ ".png"
        , width <| String.fromFloat w
        , height <| String.fromFloat h
        , Svg.Attributes.x <| String.fromFloat x
        , Svg.Attributes.y <| String.fromFloat y
        , Svg.Events.onMouseOver <| Message.OnSystemHover index
        , Svg.Events.onMouseOut <| Message.OnSystemHoverOut
        , Svg.Events.onClick <| Message.OnSystemClicked index
        ]
        []


makeTileOverlay color =
    let
        inset =
            0.9

        w =
            2 / sqrt 3 * scale * inset

        h =
            1.0 * scale * inset

        points =
            [ ( w / 4, -h / 2 )
            , ( w / 2, 0 )
            , ( w / 4, h / 2 )
            , ( -w / 4, h / 2 )
            , ( -w / 2, 0 )
            , ( -w / 4, -h / 2 )
            ]
                |> List.map (\( u, v ) -> String.fromFloat u ++ "," ++ String.fromFloat v)
                |> String.join " "
    in
    Svg.polygon
        [ Svg.Attributes.points points, fill "none", stroke color, strokeWidth "4" ]
        []


viewTile hover selection ( ( u, v ), system ) =
    let
        ( px, py ) =
            transformCoords ( u, v )

        ( sx, sy ) =
            ( String.fromFloat px, String.fromFloat py )

        overlap =
            1

        imgWidth =
            2 / sqrt 3 * scale + overlap

        imgHeight =
            scale + overlap

        color =
            if Just system.number == selection then
                Just "red"

            else if Just system.number == hover then
                Just "blue"

            else
                Nothing

        overlay =
            color
                |> Maybe.map makeTileOverlay
                |> Maybe.map List.singleton
                |> Maybe.withDefault []

        elements =
            [ makeSystemImage system.number imgWidth imgHeight (-imgWidth / 2) (-imgHeight / 2) ]
                ++ overlay
    in
    Svg.g
        [ transform <| "translate(" ++ sx ++ "," ++ sy ++ ")" ]
        elements


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
                        makeSystemImage sys.number imgWidth imgHeight 0 (toFloat i * imgHeight)
                    )
    in
    Svg.svg
        [ viewBox <| "0 0 " ++ w ++ " " ++ h, width "100" ]
        images


view map hover selection =
    Svg.svg
        [ viewBox "-250 -250 500 500", width "900", height "900" ]
        (Dict.toList map |> List.map (viewTile hover selection))
