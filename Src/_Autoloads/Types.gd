extends Node

enum Direction { Top, Right, Down, Left }
enum GameStates {Menu, Game, Settings} 

enum WindowType {Expedition = 0, Event = 1, Char = 2, Move = 3, ResFb = 4}
enum GameOverType {Water, Food, Faith, Units}

enum EventTypes {Expedition, Gameplay, TurnRandom}

enum CharEventType {Expedition, Sacrifice, Overview}

enum BiomeType {Desert, Forest, Mountain, Savana}

enum UnitTypes {
	Princess,
	Swordsman,
	Chieftan,
	Philosopher,
	Farmer,
	Oracle,
	Traveller,
	Merchant,
	Hussard,
	Priest
}

enum ExpeditionSpots  {
	LAKES = 0,
	HUNTING = 1,
	RUINS = 2,
	BERRIES = 3,
	CREEKS = 4,
	HOME_BASE = 5,
	NORMAL = 6
}

enum ResourceType {Water = 0, Food, Faith}

var grid_getter : GridGetter = GridGetter.new()
var unit_getter : UnitGetter = UnitGetter.new()
var resources_getter : ResourcesGetter = ResourcesGetter.new()
var events_getter : EventsGetter = EventsGetter.new()
var enemy_army_getter: EnemyArmyGetter = EnemyArmyGetter.new()
