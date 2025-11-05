# Main autoload: Users add this to Project Settings > Autoload (name: "ModKit")
# Exposes sibling scripts as typed vars for autocomplete and direct access.
# E.g., ModKit.SceneManager.change_scene_to_file("res://level.tscn")

extends Node

const SceneManagerScript = preload("res://addons/disboard_modkit/modkit/scene_manager.gd")

var scene_manager: SceneManager  # Autocomplete from SceneManagerScript

func _ready():
	# Instance and assign (runs once on startup)
	scene_manager = SceneManagerScript.new()
	add_child(scene_manager, true)  # Optional: As child for scene tree
	scene_manager.name = "SceneManager"
	
	print("ModKit ready: SceneManager and MultiplayerManager exposed.")
