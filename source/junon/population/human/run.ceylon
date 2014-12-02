import java.lang {
	Thread
}
import java.util.concurrent {
	CountDownLatch
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
	// use 10 humans
	value nbOHumans = 10;
	// signal used to wait for the end of all threads execution
	CountDownLatch doneSignal = CountDownLatch(nbOHumans);
	// instantiate the humans
	[Human*] humans = [for (loop in 0:nbOHumans) Human("Hitman " + loop.string, doneSignal)];
	
	// launch a human by thread
	for (human in humans) {
		Thread thread = Thread(human);
		thread.start();
	}
	
	// wait for the death of all human
	doneSignal.await();
	
	// resume the humans life durations
	for (human in humans) {
		print(human.name + " lived " + human.nbOfTurn.string + " days");
	}
}
