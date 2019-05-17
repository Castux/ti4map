module Map exposing (Layout, Location, Map, SystemIndex(..), getNeighbours, getOwners, makeBasicMap, standardLayout, swapTiles)

import Dict exposing (Dict)
import System


type alias Location =
    ( Int, Int )


type alias Layout =
    { locations : List Location
    , homes : List Location
    , mecatol : Location
    }


type SystemIndex
    = DummyHome Int
    | RegularSystem Int


type alias Tile =
    ( Location, SystemIndex )


type alias Map =
    { tiles : List Tile
    , unusedSystems : List SystemIndex
    }


makeBasicMap : Layout -> Map
makeBasicMap layout =
    let
        homes =
            List.indexedMap (\i loc -> ( loc, DummyHome i )) layout.homes

        mecatolTile =
            ( layout.mecatol, RegularSystem 18 )

        normalLocations =
            layout.locations
                |> List.filter (\loc -> loc /= layout.mecatol && not (List.any ((==) loc) layout.homes))

        regularSystems =
            List.map RegularSystem System.normalSystems

        usedSystems =
            List.take (List.length normalLocations) regularSystems

        unusedSystems =
            List.drop (List.length normalLocations) regularSystems

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


swapTiles : Map -> SystemIndex -> SystemIndex -> Map
swapTiles map index1 index2 =
    let
        helper v =
            if v == index1 then
                index2

            else if v == index2 then
                index1

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


areRawNeighbours : Location -> Location -> Bool
areRawNeighbours ( u, v ) ( x, y ) =
    let
        dx =
            x - u

        dy =
            y - v

        direct =
            dx * dx + dy * dy == 1

        indirect =
            dx * dy == -1
    in
    direct || indirect


areWormholeNeighbours index1 index2 =
    case ( index1, index2 ) of
        ( RegularSystem i, RegularSystem j ) ->
            let
                w1 =
                    System.getWormhole i

                w2 =
                    System.getWormhole j
            in
            w1 /= Nothing && w1 == w2

        _ ->
            False


areNeighbours ( loc1, index1 ) ( loc2, index2 ) =
    areRawNeighbours loc1 loc2 || areWormholeNeighbours index1 index2


getNeighbours map originTile =
    map |> List.filter (areNeighbours originTile)


floodFillStep currentTiles candidates acc depth =
    let
        ( next, rest ) =
            candidates
                |> List.partition (\c -> List.any (areNeighbours c) currentTiles)

        distances =
            next |> List.map (\tile -> ( tile, depth ))

        nextAcc =
            acc ++ distances
    in
    case rest of
        [] ->
            nextAcc

        l ->
            floodFillStep next rest nextAcc (depth + 1)


getDistances : List Tile -> Tile -> List ( Tile, Int )
getDistances tiles origin =
    let
        currentTiles =
            [ origin ]

        candidates =
            tiles
                |> List.filter ((/=) origin)
                |> List.filter
                    (\( loc, index ) ->
                        case index of
                            RegularSystem i ->
                                not (System.isBlocked i)

                            _ ->
                                True
                    )

        acc =
            [ ( origin, 0 ) ]
    in
    floodFillStep currentTiles candidates acc 1


getOwners map tile =
    let
        homes =
            getDistances map tile
                |> List.filterMap
                    (\( t, dist ) ->
                        case t of
                            ( loc, DummyHome i ) ->
                                Just ( i, dist )

                            _ ->
                                Nothing
                    )

        bestDistance =
            homes
                |> List.map Tuple.second
                |> List.minimum

        contestants =
            homes
                |> List.filter (Tuple.second >> Just >> (==) bestDistance)
                |> List.map Tuple.first
    in
    contestants
