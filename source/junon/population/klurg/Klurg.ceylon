import java.lang {
	Math
}

import junon.population {
	Race,
	working,
	eating,
	Activity,
	sleeping
}

shared class Klurg(name) extends Race(KlurgCharacteristics()) {
	shared actual String type => "Klurg";
	"Identification of the race instance"
	shared actual String name;
	
	"80 percent of chances to change the current activity"
	shared actual void chooseActivity() {
		// 80% of thances to change
		if (Math.random() < 0.8) {
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
	
	"String representation of the human"
	shared actual String string => isAlive then "Name: ``name`` [``super.string``]" else "``name`` is dead after ``characteristics.nbOfTurn`` turns";
}
