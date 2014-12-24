shared abstract class Characteristics() {
	
	"Number of action that can be executed within a turn"
	shared default Integer nbAction = 3;
	
	"Number of turn  that has been executed until he died"
	shared default variable Integer nbOfTurn = 0;
	
	"The energy used to process its activities"
	shared default variable Integer currentLevelOfEnergy = 10;
	
	"The max level of energy"
	shared default Integer levelMaxOfEnergy = 10;
	
	"Consume the given level of energy"
	shared void consumeEnergy(Integer energyConsumed) {
		currentLevelOfEnergy = currentLevelOfEnergy - energyConsumed;
	}
	
	"Increase the level of energy"
	shared void provideEnergy(Integer energyGenerated) {
		currentLevelOfEnergy = currentLevelOfEnergy + energyGenerated;
		if (currentLevelOfEnergy > levelMaxOfEnergy) {
			currentLevelOfEnergy = levelMaxOfEnergy;
		}
	}
	
	"String representation of the board"
	shared actual String string => "Energy(``currentLevelOfEnergy``/``levelMaxOfEnergy``) | Age(``nbOfTurn``)";
}
