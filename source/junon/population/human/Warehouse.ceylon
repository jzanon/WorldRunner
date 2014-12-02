"Singleton pattern:
 TODO: Check if this implementation for this pattern is the good one"
Warehouse instance = Warehouse();
shared Warehouse getWarehouseInstance() => instance;

shared class Warehouse(food = 0) {
	"The number of food items available into the Wharehouse"
	shared variable Integer food;
	
	"Pick given number of food from the warehouse. 
	       If the warehouse does not contain enought food, only number of food contained into the wharehouse will be returned. "
	shared Integer pickFood(Integer nbFoodToPick) {
		variable Integer foodToReturn = food - nbFoodToPick;
		if (food < nbFoodToPick) {
			foodToReturn = food;
		}
		food = food - foodToReturn;
		
		return foodToReturn;
	}
	"Add given number of food item into the warehouse.
	    No limit max for now."
	shared void addFood(Integer nbFoodToAdd) { food = food + nbFoodToAdd; }
}
