module MapView exposing (view, viewUnusedSystems)

import Dict exposing (Dict)
import Html
import Map
import Message
import Svg
import Svg.Attributes
    exposing
        ( cx
        , cy
        , fill
        , fillOpacity
        , fontFamily
        , fontSize
        , height
        , r
        , stroke
        , strokeDasharray
        , strokeWidth
        , transform
        , viewBox
        , width
        , xlinkHref
        )
import Svg.Events


scale =
    70


transformCoords ( u, v ) =
    ( toFloat u * sqrt 3 * 0.5 * scale
    , (toFloat v + toFloat u * 0.5) * scale
    )


makeSystemImage index w h x y =
    let
        pngIndex =
            case index of
                Map.DummyHome i ->
                    0

                Map.RegularSystem i ->
                    i
    in
    Svg.image
        [ xlinkHref <| "../img/tile" ++ String.fromInt pngIndex ++ ".png"
        , width <| String.fromFloat w
        , height <| String.fromFloat h
        , Svg.Attributes.x <| String.fromFloat x
        , Svg.Attributes.y <| String.fromFloat y
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
        [ Svg.Attributes.points points
        , fill "none"
        , stroke color
        , strokeWidth "4"
        , strokeDasharray "15,10"
        ]
        []


viewTile hover selected ownersFunc ( ( u, v ), system ) =
    let
        tile =
            ( ( u, v ), system )

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
            if Just system == selected then
                Just "red"

            else if Just system == hover then
                Just "blue"

            else
                Nothing

        overlay =
            color
                |> Maybe.map makeTileOverlay
                |> Maybe.map List.singleton
                |> Maybe.withDefault []

        owners =
            ownersFunc tile
                |> List.map String.fromInt
                |> String.join ","

        ownersText =
            [ Svg.text_
                [ fill "white", fontFamily "sans", fontSize "12", Svg.Attributes.x "-10" ]
                [ Svg.text <| owners ]
            ]

        elements =
            [ makeSystemImage system imgWidth imgHeight (-imgWidth / 2) (-imgHeight / 2) ]
                ++ overlay
                ++ ownersText
    in
    Svg.g
        [ transform <| "translate(" ++ sx ++ "," ++ sy ++ ")"
        , Svg.Events.onMouseOver <| Message.OnSystemHover system
        , Svg.Events.onMouseOut <| Message.OnSystemHoverOut
        , Svg.Events.onClick <| Message.OnSystemClicked system
        ]
        elements


viewUnusedSystems systems hover selected =
    let
        h =
            scale * List.length systems |> String.fromInt

        w =
            scale |> String.fromInt

        images =
            systems
                |> List.indexedMap (\i sys -> viewTile hover selected (\t -> []) ( ( 0, i ), sys ))
    in
    Svg.svg
        [ viewBox <| "-50 -35 100 " ++ h, width "140", height "900" ]
        images


view map hover selected =
    let
        hoverLoc =
            map
                |> List.filter (\( loc, index ) -> Just index == hover)
                |> List.map Tuple.first
                |> List.head
    in
    Svg.svg
        [ viewBox "-250 -250 500 500", width "900", height "900" ]
        (map |> List.map (viewTile hover selected (Map.getOwners map)))
