module Systems exposing (Anomaly(..), Planet, System, Tech(..), Trait(..), Wormhole(..), systems)


type Trait
    = Hazardous
    | Cultural
    | Industrial


type Tech
    = Red
    | Blue
    | Yellow
    | Green


type Wormhole
    = Alpha
    | Beta


type Anomaly
    = AsteroidField
    | Supernova
    | GravityRift
    | Nebula


type alias Planet =
    { name : String
    , resources : Int
    , influence : Int
    , trait : Maybe Trait
    , tech : Maybe Tech
    }


type alias System =
    { number : Int
    , planets : List Planet
    , wormhole : Maybe Wormhole
    , anomaly : Maybe Anomaly
    }


systems : List System
systems =
    [ { number = 18
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Mecatol Rex"
              , resources = 1
              , influence = 6
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 38
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Abyz"
              , resources = 3
              , influence = 0
              , trait = Just Hazardous
              , tech = Nothing
              }
            , { name = "Fria"
              , resources = 2
              , influence = 0
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 19
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Wellon"
              , resources = 1
              , influence = 2
              , trait = Just Industrial
              , tech = Just Yellow
              }
            ]
      }
    , { number = 34
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Centauri"
              , resources = 1
              , influence = 3
              , trait = Just Cultural
              , tech = Nothing
              }
            , { name = "Gral"
              , resources = 1
              , influence = 1
              , trait = Just Industrial
              , tech = Just Blue
              }
            ]
      }
    , { number = 33
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Corneeq"
              , resources = 1
              , influence = 2
              , trait = Just Cultural
              , tech = Nothing
              }
            , { name = "Resculon"
              , resources = 2
              , influence = 0
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 25
      , wormhole = Just Beta
      , anomaly = Nothing
      , planets =
            [ { name = "Quann"
              , resources = 2
              , influence = 1
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 29
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Qucen'n"
              , resources = 1
              , influence = 2
              , trait = Just Industrial
              , tech = Nothing
              }
            , { name = "Rarron"
              , resources = 0
              , influence = 3
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 37
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "ARINAM"
              , resources = 1
              , influence = 2
              , trait = Just Industrial
              , tech = Nothing
              }
            , { name = "Meer"
              , resources = 0
              , influence = 4
              , trait = Just Hazardous
              , tech = Just Red
              }
            ]
      }
    , { number = 36
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Arnor"
              , resources = 2
              , influence = 1
              , trait = Just Industrial
              , tech = Nothing
              }
            , { name = "Lor"
              , resources = 1
              , influence = 2
              , trait = Just Industrial
              , tech = Nothing
              }
            ]
      }
    , { number = 32
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Dal Bootha"
              , resources = 0
              , influence = 2
              , trait = Just Cultural
              , tech = Nothing
              }
            , { name = "Xxehan"
              , resources = 1
              , influence = 1
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 22
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Tar'Mann"
              , resources = 1
              , influence = 1
              , trait = Just Industrial
              , tech = Just Green
              }
            ]
      }
    , { number = 23
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Saudor"
              , resources = 2
              , influence = 2
              , trait = Just Industrial
              , tech = Nothing
              }
            ]
      }
    , { number = 35
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Bereg"
              , resources = 3
              , influence = 1
              , trait = Just Hazardous
              , tech = Nothing
              }
            , { name = "Lirta IV"
              , resources = 2
              , influence = 3
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 21
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Thibah"
              , resources = 1
              , influence = 1
              , trait = Just Industrial
              , tech = Just Blue
              }
            ]
      }
    , { number = 20
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Vefut II"
              , resources = 2
              , influence = 2
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 24
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Mehar Xull"
              , resources = 1
              , influence = 3
              , trait = Just Hazardous
              , tech = Just Red
              }
            ]
      }
    , { number = 27
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "New Albion"
              , resources = 1
              , influence = 1
              , trait = Just Industrial
              , tech = Just Green
              }
            , { name = "Starpoint"
              , resources = 3
              , influence = 1
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 26
      , wormhole = Just Alpha
      , anomaly = Nothing
      , planets =
            [ { name = "Lodor"
              , resources = 3
              , influence = 1
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 28
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Tequ'Ran"
              , resources = 2
              , influence = 0
              , trait = Just Hazardous
              , tech = Nothing
              }
            , { name = "Torkan"
              , resources = 0
              , influence = 3
              , trait = Just Cultural
              , tech = Nothing
              }
            ]
      }
    , { number = 31
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Lazar"
              , resources = 1
              , influence = 0
              , trait = Just Industrial
              , tech = Just Yellow
              }
            , { name = "Sakulag"
              , resources = 2
              , influence = 1
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 30
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Mellon"
              , resources = 0
              , influence = 2
              , trait = Just Cultural
              , tech = Nothing
              }
            , { name = "Zohbat"
              , resources = 3
              , influence = 1
              , trait = Just Hazardous
              , tech = Nothing
              }
            ]
      }
    , { number = 45
      , wormhole = Nothing
      , anomaly = Just AsteroidField
      , planets =
            []
      }
    , { number = 49
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 43
      , wormhole = Nothing
      , anomaly = Just Supernova
      , planets =
            []
      }
    , { number = 40
      , wormhole = Just Beta
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 46
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 50
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 44
      , wormhole = Nothing
      , anomaly = Just AsteroidField
      , planets =
            []
      }
    , { number = 47
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 48
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 41
      , wormhole = Nothing
      , anomaly = Just GravityRift
      , planets =
            []
      }
    , { number = 42
      , wormhole = Nothing
      , anomaly = Just Nebula
      , planets =
            []
      }
    , { number = 39
      , wormhole = Just Alpha
      , anomaly = Nothing
      , planets =
            []
      }
    , { number = 1
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Jord"
              , resources = 4
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 2
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Moll Primus"
              , resources = 4
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 3
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Darien"
              , resources = 4
              , influence = 4
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 4
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Muaat"
              , resources = 4
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 5
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Nestphar"
              , resources = 3
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 6
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "0.0.0"
              , resources = 5
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 7
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Winnu"
              , resources = 3
              , influence = 4
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 8
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Mordai II"
              , resources = 4
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 9
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Maaluuk"
              , resources = 0
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Druaa"
              , resources = 3
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 10
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Arc Prime"
              , resources = 4
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Wren Terra"
              , resources = 2
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 11
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Lisis II"
              , resources = 1
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Ragh"
              , resources = 2
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 12
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Nar"
              , resources = 2
              , influence = 3
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Jol"
              , resources = 1
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 13
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Tren'Lak"
              , resources = 1
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Quinarra"
              , resources = 3
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 14
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Archon Ren"
              , resources = 2
              , influence = 3
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Archon Tau"
              , resources = 1
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 15
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Retillion"
              , resources = 2
              , influence = 3
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Shalloq"
              , resources = 1
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 16
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Hercant"
              , resources = 1
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Kamdorn"
              , resources = 0
              , influence = 1
              , trait = Nothing
              , tech = Nothing
              }
            , { name = "Arretze"
              , resources = 2
              , influence = 0
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    , { number = 17
      , wormhole = Nothing
      , anomaly = Nothing
      , planets =
            [ { name = "Creuss"
              , resources = 4
              , influence = 2
              , trait = Nothing
              , tech = Nothing
              }
            ]
      }
    ]
