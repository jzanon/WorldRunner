import junon.population {
	Activity
}
shared abstract class Race(characteristics) satisfies Named {
	
	shared variable Characteristics characteristics;
	
	shared formal String type;
	
	shared Boolean isAlive => characteristics.currentLevelOfEnergy > 0;
	
	"Defines what the race is currently doing"
	shared variable Activity currentActivity = sleeping;
	
	shared default void processActivity() {
		switch (currentActivity)
		case (sleeping) {
			characteristics.provideEnergy(1);
		}
		case (working) {
			characteristics.consumeEnergy(8);
			getWharehouse(this).addFood(2);
		}
		case (eating) {
			Integer availableFood = getWharehouse(this).pickFood(2);
			characteristics.provideEnergy(availableFood);
		}
		else {
			print("``currentActivity.name`` is not implemented for ``name``");
		}
	}
	
	shared default void chooseActivity() {
		Activity previousActivity = currentActivity;
		
		switch (currentActivity)
		case (sleeping) { currentActivity = working; }
		case (working) { currentActivity = eating; }
		case (eating) { currentActivity = sleeping; }
		else { currentActivity = working; }
		
		print("``name`` changed it's activity from ``previousActivity.name`` to ``currentActivity.name``");
		
		// activity modification consume 1 of energy
		characteristics.consumeEnergy(1);
	}
	
	"String representation of the race"
	shared actual default String string => isAlive then "Race: ``type`` [``characteristics``]" else "Race: ``type`` is dead after ``characteristics.nbOfTurn`` turns";
}
