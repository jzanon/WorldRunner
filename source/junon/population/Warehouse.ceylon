import junon.population.human {
	Human
}
import junon.population.klurg {
	Klurg
}

"Singleton pattern:
 TODO: Check if this implementation for this pattern is the good one"
Warehouse humanWarehouse = Warehouse();
Warehouse klurgWarehouse = Warehouse();

"Get the warehouse of the given Race. If the Race is unknown an empty one is returned."
shared Warehouse getWharehouse(Race race) {
	switch (race)
	case (is Human) { return humanWarehouse; }
	case (is Klurg) { return klurgWarehouse; }
	else { return Warehouse(); }
}

shared class Warehouse(food = 0) {
	"Maximum number of food stored into the warehouse"
	Integer maxFood = 50;
	
	"The number of food items available into the Wharehouse"
	variable Integer food;
	
	"Pick given number of food from the warehouse. If the warehouse does not contain enought food, 
	       only number of food contained into the wharehouse will be returned. "
	shared Integer pickFood(Integer nbFoodToPick) {
		variable Integer foodToReturn = nbFoodToPick;
		if (food < nbFoodToPick) {
			foodToReturn = food;
		}
		food = food - foodToReturn;
		print("Warehouse: " + foodToReturn.string + " food picked, total remaining: " + food.string);
		return foodToReturn;
	}
	"Add given number of food item into the warehouse."
	shared void addFood(Integer nbFoodToAdd) {
		food = food + nbFoodToAdd;
		if (food < maxFood) {
			print("Warehouse: " + nbFoodToAdd.string + " food added, total remaining: " + food.string);
		} else {
			food = maxFood;
			print("Warehouse is full: " + maxFood.string);
		}
	}
}
