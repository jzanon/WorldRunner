import junon.population.human {
	Human
}

"Singleton pattern:
 TODO: Check if this implementation for this pattern is the good one"
Warehouse humanWarehouse = Warehouse();
Warehouse klurgWarehouse = Warehouse();

shared Warehouse getWharehouse(Race race) {
	switch (race)
	case (is Human) { return humanWarehouse; }
	else { return klurgWarehouse; }
}

shared class Warehouse(food = 0) {
	Integer maxFood = 50;
	
	"The number of food items available into the Wharehouse"
	variable Integer food;
	
	"Pick given number of food from the warehouse. 
	                                                       If the warehouse does not contain enought food, only number of food contained into the wharehouse will be returned. "
	shared Integer pickFood(Integer nbFoodToPick) {
		variable Integer foodToReturn = nbFoodToPick;
		if (food < nbFoodToPick) {
			foodToReturn = food;
		}
		food = food - foodToReturn;
		print("Warehouse: " + foodToReturn.string + " food picked, total remaining: " + food.string);
		return foodToReturn;
	}
	"Add given number of food item into the warehouse.
	                                                    No limit max for now."
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
