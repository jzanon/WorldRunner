import junon.population {
	Characteristics
}
class HumanCharacteristics() extends Characteristics() {
	"Number of action that can be executed within a turn"
	shared actual Integer nbAction = 3;
	
	"Number of turn  that has been executed until he died"
	shared actual variable Integer nbOfTurn = 0;
	
	"The energy used to process its activities"
	shared actual variable Integer currentLevelOfEnergy = 10;
	
	"The max level of energy"
	shared actual Integer levelMaxOfEnergy = 10;
}