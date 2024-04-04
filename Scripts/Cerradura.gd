extends Area2D

var objectes :int = 0
@export var VolverAJugar :PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	objectes = get_parent().get_parent().get_child_count() # Replace with function body.

func funcio_canvi(escena):
	get_tree().change_scene_to_packed(escena)

func _on_body_entered(body):
	if get_parent().get_parent().get_child_count() < objectes:
		call_deferred('funcio_canvi', VolverAJugar)
