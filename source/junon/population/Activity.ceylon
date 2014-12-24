
shared abstract class Activity(name) satisfies Named {
	"Identification of the activity"
	shared actual String name;
}

"working activity consists in consumming energy from the worker in order to produce food adding it to the warehouse."
shared object working extends Activity("Work") {

}

"sleeping activity consists in providing energy without doing nothing else."
shared object sleeping extends Activity("Sleep") {

}

"eating activity consists in consumming food from the warehouse in order to provide energy to the consumer."
shared object eating extends Activity("Eat") {

}
