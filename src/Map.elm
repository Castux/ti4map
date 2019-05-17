module Map exposing (Layout, Location, Map, makeBasicMap, standardLayout, swapTiles)

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
    { tiles : List ( Location, Int )
    , unusedSystems : List Int
    }


makeBasicMap : Layout -> Map
makeBasicMap layout =
    let
        homes =
            List.indexedMap (\i loc -> ( loc, -i )) layout.homes

        mecatolTile =
            ( layout.mecatol, 18 )

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
            homes ++ [ mecatolTile ] ++ normalTiles
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


swapTiles : Map -> Int -> Int -> Map
swapTiles map number1 number2 =
    let
        helper v =
            if v == number1 then
                number2

            else if v == number2 then
                number1

            else
                v

        newTiles =
            List.map (\( loc, sys ) -> ( loc, helper sys )) map.tiles

        newUnused =
            List.map helper map.unusedSystems
    in
    { tiles = newTiles
    , unusedSystems = newUnused
    }
