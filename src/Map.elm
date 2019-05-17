module Map exposing (Layout, Location, Map, makeBasicMap, standardLayout)

import Dict exposing (Dict)
import System


type alias Location =
    ( Int, Int )


type alias Layout =
    { locations : List Location
    , homes : List Location
    , mecatol : Location
    }


type alias Map =
    { tiles : Dict Location System.System
    , unusedSystems : List System.System
    }


makeBasicMap : Layout -> Map
makeBasicMap layout =
    let
        homes =
            List.map (\loc -> ( loc, System.dummyHome )) layout.homes

        mecatol =
            System.findSystem 18
                |> Maybe.withDefault System.dummyHome

        emptySystem =
            System.findSystem 50
                |> Maybe.withDefault System.dummyHome

        mecatolTile =
            ( layout.mecatol, mecatol )

        normalLocations =
            layout.locations
                |> List.filter (\loc -> loc /= layout.mecatol && not (List.any ((==) loc) layout.homes))

        usedSystems =
            List.take (List.length normalLocations) System.normalSystems

        unusedSystems =
            List.drop (List.length normalLocations) System.normalSystems

        normalTiles =
            List.map2 Tuple.pair normalLocations usedSystems

        result =
            Dict.fromList <| homes ++ [ mecatolTile ] ++ normalTiles
    in
    { tiles = result
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
