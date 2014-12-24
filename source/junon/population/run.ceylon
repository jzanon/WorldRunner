import java.lang {
	Thread
}
import java.util.concurrent {
	CountDownLatch
}

import junon.population.human {
	Human
}
import junon.population.klurg {
	Klurg
}
"Run the module `junon.population.human`."
// a little helper function
Float? askUserForNumber(String question) {
	process.write(question);
	String? userX = process.readLine();
	if (is String userX) {
		return parseFloat(userX);
	}
	return null;
}

shared void run() {
	print("Simulation is starting");
	// initial population 
	value nbOfHumans = 10;
	value nbOfKlurgs = 10;
	value nbOfRunner = 10;
	
	// signal used to wait for the end of all threads execution
	CountDownLatch doneSignal = CountDownLatch(nbOfRunner);
	
	// instantiate the humans
	variable {Race*} population = { for (loop in 0:nbOfHumans) Human("Hitman ``loop.string``") };
	population = population.chain({ for (loop in 0:nbOfKlurgs) Klurg("Klurg ``loop.string``") });
	
	// launch 10 runner 
	for (i in 0:nbOfRunner) {
		variable Thread thread = Thread(Runner(i, population, doneSignal));
		thread.start();
	}
	
	// wait for the death of all human
	doneSignal.await();
	
	print("Simulation is over");
}
