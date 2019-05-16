module Map exposing (Layout, Location, makeBasicMap, standardLayout)

import Systems


type alias Location =
    ( Int, Int )


type alias Layout =
    { locations : List Location
    , homes : List Location
    , mecatol : Location
    }


type alias Map =
    { tiles : List ( Location, Systems.System )
    , unusedSystems : List Systems.System
    }


makeBasicMap : Layout -> Map
makeBasicMap layout =
    let
        homes =
            List.map (\loc -> ( loc, Systems.dummyHome )) layout.homes

        mecatol =
            Systems.findSystem 18
                |> Maybe.withDefault Systems.dummyHome

        emptySystem =
            Systems.findSystem 50
                |> Maybe.withDefault Systems.dummyHome

        mecatolTile =
            ( layout.mecatol, mecatol )

        normalLocations =
            layout.locations
                |> List.filter (\loc -> loc /= layout.mecatol && not (List.any ((==) loc) layout.homes))

        usedSystems =
            List.take (List.length normalLocations) Systems.normalSystems

        unusedSystems =
            List.drop (List.length normalLocations) Systems.normalSystems

        result =
            List.map2 Tuple.pair normalLocations usedSystems
    in
    { tiles = homes ++ [ mecatolTile ] ++ result
    , unusedSystems = unusedSystems
    }


standardLayout : Layout
standardLayout =
    { locations =
        [ ( 0, -3 )
        , ( 0, -2 )
        , ( 0, -1 )
        , ( 0, 0 )
        , ( 0, 1 )
        , ( 0, 2 )
        , ( 0, 3 )
        , ( 1, -3 )
        , ( 1, -2 )
        , ( 1, -1 )
        , ( 1, 0 )
        , ( 1, 1 )
        , ( 1, 2 )
        , ( 2, -3 )
        , ( 2, -2 )
        , ( 2, -1 )
        , ( 2, 0 )
        , ( 2, 1 )
        , ( 3, -3 )
        , ( 3, -2 )
        , ( 3, -1 )
        , ( 3, 0 )
        , ( -1, -2 )
        , ( -1, -1 )
        , ( -1, 0 )
        , ( -1, 1 )
        , ( -1, 2 )
        , ( -1, 3 )
        , ( -2, -1 )
        , ( -2, 0 )
        , ( -2, 1 )
        , ( -2, 2 )
        , ( -2, 3 )
        , ( -3, 0 )
        , ( -3, 1 )
        , ( -3, 2 )
        , ( -3, 3 )
        ]
    , homes = [ ( 0, -3 ), ( 0, 3 ), ( 3, -3 ), ( -3, 3 ), ( -3, 0 ), ( 3, 0 ) ]
    , mecatol = ( 0, 0 )
    }
