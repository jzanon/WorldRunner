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
	value nbOHumans = 10;
	CountDownLatch doneSignal = CountDownLatch(nbOHumans);
	[Human*] humans = [for (loop in 0:nbOHumans) Human("Hitman " + loop.string, doneSignal)];
	
	for (human in humans) {
		Thread thread = Thread(human);
		thread.start();
	}
	
	doneSignal.await();
	
	for (human in humans) {
		print(human.name + " lived " + human.nbOfTurn.string + " days");
	}
}
