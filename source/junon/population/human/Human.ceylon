import java.lang {
	Math
}

import junon.population {
	Activity,
	sleeping,
	working,
	eating,
	Race
}

shared class Human(name) extends Race(HumanCharacteristics()) {
	
	shared actual String type => "Human";
	
	"Identification of the race instance"
	shared actual String name;
	
	"String representation of the human"
	shared actual String string => isAlive then "Name: ``name`` [``super.string``]" else "``name`` is dead after ``characteristics.nbOfTurn`` turns";
	
	"20 percent of chances to change the current activity"
	shared actual void chooseActivity() {
		// 20% of thances to change
		if (Math.random() < 0.2) {
			Activity previousActivity = currentActivity;
			
			switch (currentActivity)
			case (sleeping) { currentActivity = working; }
			case (working) { currentActivity = eating; }
			case (eating) { currentActivity = sleeping; }
			else { currentActivity = working; }
			
			print(name + " changed it's activity from '" + previousActivity.name + "' to '" + currentActivity.name + "'");
			
			// activity modification consume 1 of energy
			characteristics.consumeEnergy(1);
		} else {
			print(name + " didn't changed it's activity");
		}
	}
}
