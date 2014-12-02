shared abstract class Activity(name) satisfies Named {
	"Identification of the activity"
	shared actual String name;
	shared formal void process(Human human);
}

"working activity consists in consumming energy from the worker in order to produce food adding it to the warehouse."
shared object working extends Activity("Work") {
	
	shared actual void process(Human human) {
		print(human.name + " is working");
		human.consumeEnergy(3);
		getWarehouseInstance().addFood(2);
	}
}

"sleeping activity consists in providing energy without doing nothing else."
shared object sleeping extends Activity("Sleep") {
	shared actual void process(Human human) {
		print(human.name + " is sleeping!");
		human.provideEnergy(1);
	}
}

"eating activity consists in consumming food from the warehouse in order to provide energy to the consumer."
shared object eating extends Activity("Eat") {
	shared actual void process(Human human) {
		print(human.name + " is eating!");
		Integer availableFood = getWarehouseInstance().pickFood(2);
		human.provideEnergy(availableFood);
	}
}
