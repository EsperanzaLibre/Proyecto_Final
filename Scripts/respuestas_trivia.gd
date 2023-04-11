extends Node

var arreglo_preguntas := {
	"Pregunta1" : {
		"Pregunta" : "¿Como se llama el Heroe de Half Life?",
		"PosiblesRespuestas": {
			1 : "Morgan Freeman",
			2 : "Gordon Freeman",
			3 : "Gordon Shumway",
			4 : "Link"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta2" : {
		"Pregunta" : "¿Que banda hizo la cancion de Duke Nukem Forever?",
		"PosiblesRespuestas": {
			1 : "Megadeath",
			2 : "The Ramones",
			3 : "Audioslave",
			4 : "The Palmers"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta3" : {
		"Pregunta" : "¿A cual juego le hicieron una pelicula?",
		"PosiblesRespuestas": {
			1 : "Warcraft",
			2 : "Tomb Raider",
			3 : "Final Fantasy",
			4 : "Todas son correctas"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta4" : {
		"Pregunta" : "¿Cual FPS es mas antiguo?",
		"PosiblesRespuestas": {
			1 : "Quake",
			2 : "Doom",
			3 : "Duke Nukem 3D",
			4 : "Wolfenstein 3D "
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta5" : {
		"Pregunta" : "¿Cuál fue primero?",
		"PosiblesRespuestas": {
			1 : "Pac-Man",
			2 : "Tetris",
			3 : "Pong",
			4 : "Donkey Kong"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta6" : {
		"Pregunta" : "¿Cómo se llama el hermano de Mario Bros?",
		"PosiblesRespuestas": {
			1 : "Luigi",
			2 : "Mario Jr.",
			3 : "Honguito",
			4 : "Luisito"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta7" : {
		"Pregunta" : "¿Cuántos luchadores hay en Street Fighter II?",
		"PosiblesRespuestas": {
			1 : "12",
			2 : "8",
			3 : "16",
			4 : "4"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta8" : {
		"Pregunta" : "¿Cuántas entradas para mandos tiene Nintendo 64?",
		"PosiblesRespuestas": {
			1 : "2",
			2 : "1",
			3 : "4",
			4 : "6"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},	
	"Pregunta9" : {
		"Pregunta" : "¿Cuál es un videojuego de autos de carrera?",
		"PosiblesRespuestas": {
			1 : "Age of Empires",
			2 : "Revolt",
			3 : "Metal Gear Solid",
			4 : "1942"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta10" : {
		"Pregunta" : "¿Cómo se llama el enemigo de Sonic?",
		"PosiblesRespuestas": {
			1 : "Dr Malito",
			2 : "Robotech",
			3 : "Tails",
			4 : "Dr Robotnik"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta11" : {
		"Pregunta" : "¿Cuál fue la primera consola de PlayStation?",
		"PosiblesRespuestas": {
			1 : "PS Project",
			2 : "PS1",
			3 : "Play One",
			4 : "PlayStation Origins"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta12" : {
		"Pregunta" : "¿De que material es la primera espada en The Legend of Zelda?",
		"PosiblesRespuestas": {
			1 : "Hueso",
			2 : "Hierro",
			3 : "Madera",
			4 : "Acero"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta13" : {
		"Pregunta" : "¿Cómo se llama la ciudad en la que desenvuelve Resident Evil?",
		"PosiblesRespuestas": {
			1 : "New York City",
			2 : "High Valley City",
			3 : "Resident City",
			4 : "Racoon City"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta14" : {
		"Pregunta" : "¿Cómo se llama el Heroe de Resident Evil?",
		"PosiblesRespuestas": {
			1 : "Leon Santillan",
			2 : "Leon Tolstoi",
			3 : "Leon Gieco",
			4 : "Leon Kennedy"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta15" : {
		"Pregunta" : "¿Cómo se llama la protagonista del juego Tomb Raider?",
		"PosiblesRespuestas": {
			1 : "Jill Valentine",
			2 : "Samus Aran",
			3 : "Lara Croft",
			4 : "Angelina Jolie"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta16" : {
		"Pregunta" : "¿Con que nombre se conoció a Mario Bros?",
		"PosiblesRespuestas": {
			1 : "Plumber Man",
			2 : "Jump Man",
			3 : "Mario Fontanero",
			4 : "Hero Man"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta17" : {
		"Pregunta" : "¿Cuál es considerado el primer juego de la historia?",
		"PosiblesRespuestas": {
			1 : "Pong",
			2 : "Asteroids",
			3 : "Polybius",
			4 : "Tenis for Two"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta18" : {
		"Pregunta" : "¿Quiénes crearon el Tetris?",
		"PosiblesRespuestas": {
			1 : "Rusos",
			2 : "Chinos",
			3 : "Japoneses",
			4 : "Estadounidenses"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta19" : {
		"Pregunta" : "¿Cuál es la primera consola de la historia?",
		"PosiblesRespuestas": {
			1 : "Atari 2600",
			2 : "Atari Jaguar",
			3 : "Magnavox Odyssey",
			4 : "Coleco Vision"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta20" : {
		"Pregunta" : "¿Cuál es el peor juego creado de la historia?",
		"PosiblesRespuestas": {
			1 : "E.T. Extraterrestre",
			2 : "Link: The face of evil",
			3 : "Superman 64",
			4 : "Sir Nacho"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta21" : {
		"Pregunta" : "¿Qué videojuego es el más vendido de todos los tiempos?",
		"PosiblesRespuestas": {
			1 : "Minecraft",
			2 : "Mario Bros",
			3 : "Fortnite",
			4 : "Sir Nacho"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta22" : {
		"Pregunta" : "¿En qué se inspiró el creador de Pac Man para crear este personaje?",
		"PosiblesRespuestas": {
			1 : "En una galleta",
			2 : "En una tarta",
			3 : "En una pizza",
			4 : "En un globo"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta23" : {
		"Pregunta" : "¿Cuál es el videojuego más caro producido hasta la fecha?",
		"PosiblesRespuestas": {
			1 : "Grand Theft Auto V",
			2 : "Tomb Raider",
			3 : "Red Dead Redemption 2",
			4 : "Sonic"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta24" : {
		"Pregunta" : "¿Cuál fue uno de los primeros juegos de la consola Atari?",
		"PosiblesRespuestas": {
			1 : "Pac Man",
			2 : "Space Invaders",
			3 : "Combat",
			4 : "Shinobi"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta25" : {
		"Pregunta" : "Cuál de estos videojuegos ha desarrollado Rockstar?",
		"PosiblesRespuestas": {
			1 : "Grand Theft Auto V",
			2 : "Assassin's Creed",
			3 : "Call of Duty",
			4 : "Rainbow Six"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta26" : {
		"Pregunta" : "¿En qué videojuego aparecen los Stalfos?",
		"PosiblesRespuestas": {
			1 : "Warcraft",
			2 : "God of War",
			3 : "Among Us",
			4 : "The Legend of Zelda"
		},
		"RespuestasCorrectas" : [4],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta27" : {
		"Pregunta" : "¿Cuál de estos videojuegos está considerado como uno de los más difíciles?",
		"PosiblesRespuestas": {
			1 : "World of Warcraft",
			2 : "Roblox",
			3 : "Demon's souls",
			4 : "Sir Nacho"
		},
		"RespuestasCorrectas" : [3],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta28" : {
		"Pregunta" : "¿Qué comenzó lanzando Nintendo antes que videojuegos?",
		"PosiblesRespuestas": {
			1 : "Naipes",
			2 : "Comida para gatos",
			3 : "Televisores de plasma",
			4 : "Cubos Rubix"
		},
		"RespuestasCorrectas" : [1],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta29" : {
		"Pregunta" : "¿En qué videojuegos aparece la princesa Peach?",
		"PosiblesRespuestas": {
			1 : "Pokemon",
			2 : "Super Mario",
			3 : "Dracula",
			4 : "Sonic"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	},
	"Pregunta30" : {
		"Pregunta" : "¿Por qué se llama así el videojuego Final Fantasy?",
		"PosiblesRespuestas": {
			1 : "Es por el final apocalíptico en la Tierra",
			2 : "No se pudo registrar el nombre Fighting Fantasy",
			3 : "Es sobre el final de los videojuegos",
			4 : "Porque Sir Nacho estaba ocupado"
		},
		"RespuestasCorrectas" : [2],
		"AddPoints" : 1,
		"AddXP" : 1
	}
}
