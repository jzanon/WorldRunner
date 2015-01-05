import junon.population {
	Activity
}
shared abstract class Race(characteristics) satisfies Named {
	
	"The characteristics of the race"
	shared variable Characteristics characteristics;
	
	"The type of race"
	shared formal String type;
	
	"People are alive only if their level of energy is over 0."
	shared Boolean isAlive => characteristics.currentLevelOfEnergy > 0;
	
	"Defines what the race is currently doing"
	shared variable Activity currentActivity = sleeping;
	
	"Default implementation of current activity processing."
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
	
	"Default implementation for choosing a new activity. Based on a simple activity rotation, it consume 1 energy."
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
