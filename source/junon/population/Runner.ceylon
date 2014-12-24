import java.lang {
	Runnable
}
import java.util {
	HashSet
}
import java.util.concurrent {
	CountDownLatch
}
class Runner(runnerNumber, {Race*} races, countDownLatch) satisfies Runnable {
	Integer runnerNumber;
	CountDownLatch countDownLatch;
	
	function extractRaceTypeSet(variable {Race*} peopleToRun) {
		value raceTypes = peopleToRun.map<String>((Race element) => element.type);
		HashSet<String> typeSet = HashSet<String>();
		for (type in raceTypes) {
			typeSet.add(type);
		}
		return typeSet;
	}
	
	shared actual void run() {
		variable {Race*} peopleToRun = races.select((Race element) => element.isAlive);
		print("Runner ``runnerNumber`` is starting");
		while (!peopleToRun.empty) {
			for (people in peopleToRun) {
				print(people);
				
				people.chooseActivity();
				
				if (people.isAlive) {
					people.processActivity();
				}
				people.characteristics.nbOfTurn++;
				print(people);
			}
			peopleToRun = peopleToRun.filter((Race element) => element.isAlive);
			if (peopleToRun.size > 0) {
				print("******************``peopleToRun.size`` ``extractRaceTypeSet(peopleToRun)`` `` peopleToRun.size > 1 then "are" else "is" `` still alive in Runner ``runnerNumber``");
			} else {
				print("******************Everybody is dead in Runner ``runnerNumber``");
			}
		}
		
		countDownLatch.countDown();
	}
}
