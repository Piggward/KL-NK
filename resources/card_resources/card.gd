class_name Card

extends Resource

enum Type {MONSTER, STARTING, EVENT, RESERVE, DUNGEON }

@export var skill: int
@export var score: int
@export var boots: int
@export var swords: int
@export var cost: int
@export var type: Type
@export var name: String
