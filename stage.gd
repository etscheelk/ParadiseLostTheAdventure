extends Node
class_name stage

enum nextType {isStage, isSidequest}

@export_multiline var displayText : String = " "

var numOptions : int = 6

@export_multiline var option1 : String = " "
var next1 : nextType

@export_multiline var option2 : String = " "
var next2 : nextType

@export_multiline var option3 : String = " "
var next3 : nextType

@export_multiline var option4 : String = " "
var next4 : nextType

@export_multiline var option5 : String = " "
var next5 : nextType

@export_multiline var option6 : String = " "
var next6 : nextType

func _ready():
	pass
