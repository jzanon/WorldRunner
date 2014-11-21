import java.lang {
	Runnable,
	Math
}
import java.util.concurrent {
	CountDownLatch
}
shared class Human(name, countDownLatch) satisfies Named & Runnable {
	CountDownLatch countDownLatch;
	
	"Identification of the human"
	shared actual String name;
	
	"Defines what the human is currently doing"
	shared variable Activity currentActivity = sleeping;
	
	"Number of action the human can execute within a turn"
	shared variable Integer nbAction = 3;
	
	"Number of turn the human has executed until he died"
	shared variable Integer nbOfTurn = 0;
	
	"The energy of the human used to process its activities"
	shared variable Integer currentLevelOfEnergy = 10;
	
	"The energy of the human used to process its activities"
	shared variable Integer levelMaxOfEnergy = 10;
	
	"20 percent of chances to change the current activity"
	shared void updateActivity() {
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
			consumeEnergy(1);
		} else {
			print(name + " didn't changed it's activity");
		}
	}
	
	"Process the current activity upgrading the state of the human"
	shared void processCurrentActivity() {
		print(name + " process it's activity: ");
		currentActivity.process(this);
	}
	
	shared actual void run() {
		//for (loop in 1..nbAction) {
		while (currentLevelOfEnergy > 0) {
			processCurrentActivity();
			updateActivity();
			nbOfTurn++;
		}
		countDownLatch.countDown();
		print(name + " is dead after " + nbOfTurn.string + " turns");
	}
	
	"Consume the given level of energy"
	shared void consumeEnergy(Integer energyConsumed) {
		currentLevelOfEnergy = currentLevelOfEnergy - energyConsumed;
	}
	
	"Increase the level of energy"
	shared void provideEnergy(Integer energyGenerated) {
		currentLevelOfEnergy = currentLevelOfEnergy + energyGenerated;
	}
}
