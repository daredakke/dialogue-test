extends Node

enum Names {
	MC,
	MC_MOTHER,
	MC_SISTER,
	SHOP_LADY,
	LANDLORD,
}

var actors: Dictionary = {
	Names.MC: "You",
	Names.MC_MOTHER: "Mother",
	Names.MC_SISTER: "Jane",
	Names.SHOP_LADY: "Heather",
	Names.LANDLORD: "Jason",
}

var lines = {
	actors[Names.MC_MOTHER]: [
		{
			"speaker": actors[Names.MC_MOTHER],
			"line": "Hello dear."
		},
		{
			"speaker": actors[Names.MC],
			"line": "Hey, what's up?"
		},
		{
			"speaker": actors[Names.MC_MOTHER],
			"line": "We've run out of milk. I need you to fetch me more from the store."
		},
	]
}
