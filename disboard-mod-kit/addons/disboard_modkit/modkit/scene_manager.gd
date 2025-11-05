extends Node
class_name SceneManager

@export var embedMode: bool = false
@export var embedViewport: SubViewport

func change_scene_to_packed(scene: PackedScene):
	if !embedMode:
		get_tree().change_scene_to_packed(scene)
		return
		
	# First we clear the viewport screen
	# then we instanciate a new scene and add it to the viewport
	_clear_viewport()
	var scene_instance := scene.instantiate()
	embedViewport.add_child(scene_instance)
	scene_instance.owner = embedViewport

func change_scene_to_file(path: String):
	if !embedMode:
		get_tree().change_scene_to_file(path)
		return
	
	# Just turn it into a packed scene and call
	# the change_scene_to_packed helper
	var packed_scene = ResourceLoader.load(path) as PackedScene
	self.change_scene_to_packed(packed_scene)

func _clear_viewport():
	for child in embedViewport.get_children(true):
		child.queue_free()
