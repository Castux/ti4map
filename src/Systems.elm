module Systems exposing (..)

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
    { index : Int
    , planets : List Planet
    , wormhole : Maybe Wormhole
    , anomaly : Maybe Anomaly
    }

systems : List System
systems =
[
	{
		number = 18,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Mecatol Rex",
				resources = 1,
				influence = 6,
				trait = None,
				tech = None
			}
		]
	},
	{
		number = 38,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Abyz",
				resources = 3,
				influence = 0,
				trait = Hazardous,
				tech = None
			},
			{
				name = "Fria",
				resources = 2,
				influence = 0,
				trait = Hazardous,
				tech = None
			}
		]
	},
	{
		number = 19,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Wellon",
				resources = 1,
				influence = 2,
				trait = Industrial,
				tech = Yellow
			}
		]
	},
	{
		number = 34,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Centauri",
				resources = 1,
				influence = 3,
				trait = Cultural,
				tech = None
			},
			{
				name = "Gral",
				resources = 1,
				influence = 1,
				trait = Industrial,
				tech = Blue
			}
		]
	},
	{
		number = 33,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Corneeq",
				resources = 1,
				influence = 2,
				trait = Cultural,
				tech = None
			},
			{
				name = "Resculon",
				resources = 2,
				influence = 0,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 25,
		wormhole = Beta,
		anomaly = None,
		planets = [
			{
				name = "Quann",
				resources = 2,
				influence = 1,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 29,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Qucen'n",
				resources = 1,
				influence = 2,
				trait = Industrial,
				tech = None
			},
			{
				name = "Rarron",
				resources = 0,
				influence = 3,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 37,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "ARINAM",
				resources = 1,
				influence = 2,
				trait = Industrial,
				tech = None
			},
			{
				name = "Meer",
				resources = 0,
				influence = 4,
				trait = Hazardous,
				tech = Red
			}
		]
	},
	{
		number = 36,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Arnor",
				resources = 2,
				influence = 1,
				trait = Industrial,
				tech = None
			},
			{
				name = "Lor",
				resources = 1,
				influence = 2,
				trait = Industrial,
				tech = None
			}
		]
	},
	{
		number = 32,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Dal Bootha",
				resources = 0,
				influence = 2,
				trait = Cultural,
				tech = None
			},
			{
				name = "Xxehan",
				resources = 1,
				influence = 1,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 22,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Tar'Mann",
				resources = 1,
				influence = 1,
				trait = Industrial,
				tech = Green
			}
		]
	},
	{
		number = 23,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Saudor",
				resources = 2,
				influence = 2,
				trait = Industrial,
				tech = None
			}
		]
	},
	{
		number = 35,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Bereg",
				resources = 3,
				influence = 1,
				trait = Hazardous,
				tech = None
			},
			{
				name = "Lirta IV",
				resources = 2,
				influence = 3,
				trait = Hazardous,
				tech = None
			}
		]
	},
	{
		number =21,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Thibah",
				resources = 1,
				influence = 1,
				trait = Industrial,
				tech = Blue
			}
		]
	},
	{
		number = 20,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Vefut II",
				resources = 2,
				influence = 2,
				trait = Hazardous,
				tech = None
			}
		]
	},
	{
		number = 24,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Mehar Xull",
				resources = 1,
				influence = 3,
				trait = Hazardous,
				tech = Red
			}
		]
	},
	{
		number = 27,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "New Albion",
				resources = 1,
				influence = 1,
				trait = Industrial,
				tech = Green
			},
			{
				name = "Starpoint",
				resources = 3,
				influence = 1,
				trait = Hazardous,
				tech = None
			}
		]
	},
	{
		number = 26,
		wormhole = Alpha,
		anomaly = None,
		planets = [
			{
				name = "Lodor",
				resources = 3,
				influence = 1,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 28,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Tequ'Ran",
				resources = 2,
				influence = 0,
				trait = Hazardous,
				tech = None
			},
			{
				name = "Torkan",
				resources = 0,
				influence = 3,
				trait = Cultural,
				tech = None
			}
		]
	},
	{
		number = 31,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Lazar",
				resources = 1,
				influence = 0,
				trait = Industrial,
				tech = Yellow
			},
			{
				name = "Sakulag",
				resources = 2,
				influence = 1,
				trait = Hazardous,
				tech = None
			}
		]
	},
	{
		number = 30,
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Mellon",
				resources = 0,
				influence = 2,
				trait = Cultural,
				tech = None
			},
			{
				name = "Zohbat",
				resources = 3,
				influence = 1,
				trait = Hazardous,
				tech = None
			}
		]
	},

	{
		number = 45,
		wormhole = None,
		anomaly = "ASTEROID_FIELD",
		planets = [
		]
	},
	{
		number = 49,
		wormhole = None,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 43,
		wormhole = None,
		anomaly = "SUPERNOVA",
		planets = [
		]
	},
	{
		number = 40,
		wormhole = Beta,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 46,
		wormhole = None,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 50,
		wormhole = None,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 44,
		wormhole = None,
		anomaly = AsteroidField,
		planets = [
		]
	},
	{
		number = 47,
		wormhole = None,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 48,
		wormhole = None,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 41,
		wormhole = None,
		anomaly = GravityRift,
		planets = [
		]
	},
	{
		number = 42,
		wormhole = None,
		anomaly = Nebula,
		planets = [
		]
	},
	{
		number = 39,
		wormhole = Alpha,
		anomaly = None,
		planets = [
		]
	},
	{
		number = 1,
		race = "The Federation of Sol",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Jord",
				resources = 4,
				influence = 2,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 2,
		race = "The Mentak Coalition",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Moll Primus",
				resources = 4,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 3,
		race = "The Brotherhood of Yin",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Darien",
				resources = 4,
				influence = 4,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 4,
		race = "The Embers of Muaat",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Muaat",
				resources = 4,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 5,
		race = "The Arborec",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Nestphar",
				resources = 3,
				influence = 2,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 6,
		race = "The L1Z1X Mindnet",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "0.0.0",
				resources = 5,
				influence = 0,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 7,
		race = "The Winnu",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Winnu",
				resources = 3,
				influence = 4,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 8,
		race = "The Nekro Virus",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Mordai II",
				resources = 4,
				influence = 0,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 9,
		race = "The Naalu Collective",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Maaluuk",
				resources = 0,
				influence = 2,
				trait = None,
				tech = None
			},
			{
				name = "Druaa",
				resources = 3,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 10,
		race = "The Barony of Letnev",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Arc Prime",
				resources = 4,
				influence = 0,
				trait = None,
				tech = None
			},
			{
				name = "Wren Terra",
				resources = 2,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 11,
		race = "The Clan of Saar",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Lisis II",
				resources = 1,
				influence = 0,
				trait = None,
				tech = None
			},
			{
				name = "Ragh",
				resources = 2,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 12,
		race = "The Universities of Jol-Nar",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Nar",
				resources = 2,
				influence = 3,
				trait = None,
				tech = None
			},
			{
				name = "Jol",
				resources = 1,
				influence = 2,
				trait = None,
				tech = None
			}

		]

	},
	{
		number = 13,
		race = "Sardakk N'orr",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Tren'Lak",
				resources = 1,
				influence = 0,
				trait = None,
				tech = None
			},
			{
				name = "Quinarra",
				resources = 3,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 14,
		race = "The Xxcha Kingdom",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Archon Ren",
				resources = 2,
				influence = 3,
				trait = None,
				tech = None
			},
			{
				name = "Archon Tau",
				resources = 1,
				influence = 1,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 15,
		race = "The Yssaril Tribes",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Retillion",
				resources = 2,
				influence = 3,
				trait = None,
				tech = None
			},
			{
				name = "Shalloq",
				resources = 1,
				influence = 2,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 16,
		race = "The Emirates of Hacan",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Hercant",
				resources = 1,
				influence = 1,
				trait = None,
				tech = None
			},
			{
				name = "Kamdorn",
				resources = 0,
				influence = 1,
				trait = None,
				tech = None
			},
			{
				name = "Arretze",
				resources = 2,
				influence = 0,
				trait = None,
				tech = None
			}
		]

	},
	{
		number = 17,
		race = "The Ghosts of Creuss",
		wormhole = None,
		anomaly = None,
		planets = [
			{
				name = "Creuss",
				resources = 4,
				influence = 2,
				trait = None,
				tech = None
			}
		]
	}
]
