shared abstract class Activity(name) satisfies Named {
	"Identification of the human"
	shared actual String name;
	shared formal void process(Human human);
}
shared object working extends Activity("Work") {
	
	shared actual void process(Human human) {
		print(human.name + " is working");
		human.consumeEnergy(3);
	}
}

shared object sleeping extends Activity("Sleep") {
	shared actual void process(Human human) {
		print(human.name + " is sleeping!");
		human.provideEnergy(1);
	}
}

shared object eating extends Activity("Eat") {
	shared actual void process(Human human) {
		print(human.name + " is eating!");
		human.provideEnergy(2);
	}
}
