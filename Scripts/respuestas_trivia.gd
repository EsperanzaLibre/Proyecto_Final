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
	}
}
