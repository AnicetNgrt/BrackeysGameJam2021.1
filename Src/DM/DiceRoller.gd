extends Node

#This class is in charge of rolling the dice for all the events.

var rolls : Array = []

func _ready() -> void :
	#Add the dice roll that happens each day.
	var roll : DiceRoll = NewTurnRoll.new()
	rolls.append(roll)
	
	Events.connect(Events.TURN_ANIMATED, self, "_turn_animated")
	
	Events.connect(Events.DICE_ROLL_CREATED, self, "add_dice_roll")

func _turn_animated() -> void :
	var i : int = 0
	var remove_array : PoolIntArray = PoolIntArray()
	for roll in rolls :
		var dr : DiceRoll = roll
		
		if dr.is_permanent() :
			dr.roll()
		
		else :
			dr.decrement_day()
			if dr.get_day_cost() == 0:
				dr.roll_and_free()
				remove_array.append(i)
		i += 1
	
	i = remove_array.size() - 1
	while i >= 0 :
		rolls.remove(remove_array[i])
		i -= 1

func add_dice_roll(dice_roll : DiceRoll) -> void :
	# warning-ignore:return_value_discarded
	dice_roll.connect("removed", self, "dice_removed_itself")
	rolls.append(dice_roll)

func dice_removed_itself(dice_roll : DiceRoll) -> void :
	rolls.remove(rolls.find(dice_roll))
