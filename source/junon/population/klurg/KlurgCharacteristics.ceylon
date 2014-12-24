import junon.population {
	Characteristics
}
class KlurgCharacteristics() extends Characteristics() {
	"Number of action that can be executed within a turn"
	shared actual variable Integer nbAction = 2;
	
	"Number of turn  that has been executed during its life"
	shared actual variable Integer nbOfTurn = 0;
	
	"The energy used to process its activities"
	shared actual variable Integer currentLevelOfEnergy = 7;
	
	"The max level of energy"
	shared actual Integer levelMaxOfEnergy = 15;
}
