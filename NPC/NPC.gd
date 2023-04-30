extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welocome to the Lutopia! (Press E to continue)"
	,"We the people of Lutopia need your help!"
	,"Shoot the five targets and then defeat the drone before your run out of time to save us all!"
	,"The challenge starts as soon as you press E."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")




func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
