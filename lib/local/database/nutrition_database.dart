import '../model/food_type.dart';
import '../model/nutrition_data.dart';

class NutritionDatabase {
  static List<NutritionData> foods = [
    NutritionData(name: "Almonds", calories: 7.0, protein: 0.3, carbohydrates: 0.3, fat: 0.6,),
    NutritionData(name: "Apricot", calories: 48.0, protein: 1.0, carbohydrates: 12.0, fat: 0.4),
    NutritionData(name: "Asparagus", calories: 20.0, protein: 2.2, carbohydrates: 3.7, fat: 0.2),
    NutritionData(name: "Avocado", calories: 160.0, protein: 2.0, carbohydrates: 8.5, fat: 14.7,),
    NutritionData(name: "Banana", calories: 105.0, protein: 1.3, carbohydrates: 27.0, fat: 0.3,),
    NutritionData(name: "Beef Steak", calories: 250.0, protein: 26.0, carbohydrates: 0.0, fat: 17.0),
    NutritionData(name: "Beetroot", calories: 43.0, protein: 1.6, carbohydrates: 10.0, fat: 0.2),
    NutritionData(name: "Bell Pepper", calories: 31.0, protein: 1.3, carbohydrates: 6.0, fat: 0.3),
    NutritionData(name: "Black Beans", calories: 227.0, protein: 15.0, carbohydrates: 40.0, fat: 0.9),
    NutritionData(name: "Blueberries", calories: 42.0, protein: 0.7, carbohydrates: 10.7, fat: 0.4,),
    NutritionData(name: "Broccoli", calories: 55.0, protein: 3.7, carbohydrates: 11.2, fat: 0.6,),
    NutritionData(name: "Brown Rice", calories: 215.0, protein: 5.0, carbohydrates: 45.0, fat: 1.6,),
    NutritionData(name: "Cabbage", calories: 25.0, protein: 1.3, carbohydrates: 6.0, fat: 0.1),
    NutritionData(name: "Cantaloupe", calories: 34.0, protein: 0.8, carbohydrates: 8.0, fat: 0.2),
    NutritionData(name: "Cashews", calories: 155.0, protein: 5.0, carbohydrates: 9.0, fat: 12.0),
    NutritionData(name: "Cauliflower", calories: 25.0, protein: 2.0, carbohydrates: 5.0, fat: 0.3),
    NutritionData(name: "Chicken Breast", calories: 165.0, protein: 31.0, carbohydrates: 0.6, fat: 3.6,),
    NutritionData(name: "Chicken Thigh", calories: 229.0, protein: 19.0, carbohydrates: 0.0, fat: 16.0,),
    NutritionData(name: "Chickpeas", calories: 164.0, protein: 8.9, carbohydrates: 27.0, fat: 2.6),
    NutritionData(name: "Cottage Cheese", calories: 206.0, protein: 28.0, carbohydrates: 3.0, fat: 9.0,),
    NutritionData(name: "Cucumber", calories: 16.0, protein: 0.7, carbohydrates: 4.0, fat: 0.2),
    NutritionData(name: "Egg", calories: 68.0, protein: 5.5, carbohydrates: 0.6, fat: 4.8,),
    NutritionData(name: "Eggplant", calories: 25.0, protein: 1.0, carbohydrates: 6.0, fat: 0.2),
    NutritionData(name: "Ground Beef", calories: 250.0, protein: 26.0, carbohydrates: 0.0, fat: 17.0,),
    NutritionData(name: "Greek Yogurt", calories: 100.0, protein: 10.0, carbohydrates: 4.0, fat: 6.0,),
    NutritionData(name: "Hazelnuts", calories: 628.0, protein: 15.0, carbohydrates: 17.0, fat: 61.0),
    NutritionData(name: "Kiwi", calories: 61.0, protein: 1.1, carbohydrates: 15.0, fat: 0.5),
    NutritionData(name: "Lamb", calories: 258.0, protein: 25.0, carbohydrates: 0.0, fat: 17.0),
    NutritionData(name: "Lentils", calories: 230.0, protein: 18.0, carbohydrates: 40.0, fat: 1.0,),
    NutritionData(name: "Mango", calories: 60.0, protein: 0.8, carbohydrates: 15.0, fat: 0.4),
    NutritionData(name: "Oats", calories: 68.0, protein: 2.0, carbohydrates: 12.0, fat: 1.4,),
    NutritionData(name: "Orange", calories: 62.0, protein: 1.2, carbohydrates: 15.0, fat: 0.2,),
    NutritionData(name: "Peach", calories: 39.0, protein: 0.9, carbohydrates: 10.0, fat: 0.3),
    NutritionData(name: "Peanut Butter", calories: 94.0, protein: 4.0, carbohydrates: 3.0, fat: 8.0,),
    NutritionData(name: "Pineapple", calories: 50.0, protein: 0.5, carbohydrates: 13.0, fat: 0.1),
    NutritionData(name: "Plum", calories: 46.0, protein: 1.0, carbohydrates: 11.0, fat: 0.3),
    NutritionData(name: "Potato", calories: 130.0, protein: 2.0, carbohydrates: 30.0, fat: 0.2),
    NutritionData(name: "Pork Chop", calories: 196.0, protein: 24.0, carbohydrates: 0.0, fat: 11.0),
    NutritionData(name: "Pumpkin Seeds", calories: 559.0, protein: 30.0, carbohydrates: 11.0, fat: 49.0),
    NutritionData(name: "Quinoa", calories: 120.0, protein: 4.1, carbohydrates: 21.3, fat: 1.9,),
    NutritionData(name: "Salad", calories: 50.0, protein: 2.0, carbohydrates: 10.0, fat: 0.5),
    NutritionData(name: "Salmon", calories: 206.0, protein: 22.0, carbohydrates: 0.0, fat: 13.0,),
    NutritionData(name: "Shrimp", calories: 84.0, protein: 18.0, carbohydrates: 0.0, fat: 1.0),
    NutritionData(name: "Spinach", calories: 23.0, protein: 2.9, carbohydrates: 3.6, fat: 0.4,),
    NutritionData(name: "Strawberries", calories: 32.0, protein: 0.7, carbohydrates: 8.0, fat: 0.3),
    NutritionData(name: "Sweet Potato", calories: 112.0, protein: 2.0, carbohydrates: 26.0, fat: 0.2,),
    NutritionData(name: "Raspberries", calories: 52.0, protein: 1.2, carbohydrates: 12.0, fat: 0.7),
    NutritionData(name: "Tomato", calories: 22.0, protein: 1.0, carbohydrates: 5.0, fat: 0.2,),
    NutritionData(name: "Tuna", calories: 184.0, protein: 40.0, carbohydrates: 0.0, fat: 1.0),
    NutritionData(name: "Turkey Breast", calories: 135.0, protein: 30.0, carbohydrates: 0.0, fat: 1.0),
    NutritionData(name: "Walnuts", calories: 654.0, protein: 15.0, carbohydrates: 14.0, fat: 65.0),
    NutritionData(name: "Watermelon", calories: 30.0, protein: 0.6, carbohydrates: 8.0, fat: 0.2),
    NutritionData(name: "Zucchini", calories: 20.0, protein: 1.4, carbohydrates: 4.0, fat: 0.4),
  ];

  static List<NutritionData> meals = [
    NutritionData(name: "Asian Chicken Noodle Soup", calories: 320.0, protein: 20.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "BBQ Chicken Pizza", calories: 420.0, protein: 25.0, carbohydrates: 30.0, fat: 20.0),
    NutritionData(name: "Beef and Broccoli Stir-Fry", calories: 400.0, protein: 28.0, carbohydrates: 25.0, fat: 22.0),
    NutritionData(name: "Beef and Vegetable Skewers", calories: 400.0, protein: 28.0, carbohydrates: 25.0, fat: 22.0),
    NutritionData(name: "Black Bean Enchiladas", calories: 420.0, protein: 25.0, carbohydrates: 30.0, fat: 20.0),
    NutritionData(name: "Caesar Salad with Grilled Chicken", calories: 350.0, protein: 20.0, carbohydrates: 15.0, fat: 18.0),
    NutritionData(name: "Caprese Chicken", calories: 380.0, protein: 25.0, carbohydrates: 20.0, fat: 22.0),
    NutritionData(name: "Caprese Salad", calories: 250.0, protein: 10.0, carbohydrates: 10.0, fat: 18.0),
    NutritionData(name: "Cauliflower Fried Rice", calories: 350.0, protein: 20.0, carbohydrates: 35.0, fat: 14.0),
    NutritionData(name: "Chicken Caesar Wrap", calories: 350.0, protein: 25.0, carbohydrates: 15.0, fat: 18.0),
    NutritionData(name: "Chickpea and Spinach Curry", calories: 320.0, protein: 18.0, carbohydrates: 40.0, fat: 14.0),
    NutritionData(name: "Chickpea Caesar Wrap", calories: 350.0, protein: 20.0, carbohydrates: 15.0, fat: 18.0),
    NutritionData(name: "Crispy Tofu Tacos", calories: 380.0, protein: 20.0, carbohydrates: 35.0, fat: 16.0),
    NutritionData(name: "Eggplant Parmesan", calories: 400.0, protein: 18.0, carbohydrates: 35.0, fat: 20.0),
    NutritionData(name: "Greek Gyro Wrap", calories: 380.0, protein: 25.0, carbohydrates: 30.0, fat: 16.0),
    NutritionData(name: "Grilled Chicken Salad", calories: 300.0, protein: 25.0, carbohydrates: 15.0, fat: 18.0),
    NutritionData(name: "Grilled Shrimp Tacos", calories: 320.0, protein: 25.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "Grilled Steak Salad", calories: 400.0, protein: 28.0, carbohydrates: 30.0, fat: 18.0),
    NutritionData(name: "Grilled Vegetable Wrap", calories: 400.0, protein: 18.0, carbohydrates: 45.0, fat: 15.0),
    NutritionData(name: "Hawaiian Poke Bowl", calories: 420.0, protein: 30.0, carbohydrates: 35.0, fat: 20.0),
    NutritionData(name: "Honey Mustard Chicken Salad", calories: 350.0, protein: 18.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "Lemon Garlic Shrimp", calories: 320.0, protein: 25.0, carbohydrates: 20.0, fat: 14.0),
    NutritionData(name: "Lentil Soup", calories: 320.0, protein: 18.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "Mango Salsa Chicken", calories: 420.0, protein: 30.0, carbohydrates: 25.0, fat: 22.0),
    NutritionData(name: "Mediterranean Quinoa Bowl", calories: 380.0, protein: 18.0, carbohydrates: 45.0, fat: 15.0),
    NutritionData(name: "Mushroom Risotto", calories: 350.0, protein: 15.0, carbohydrates: 40.0, fat: 14.0),
    NutritionData(name: "Pasta Primavera", calories: 350.0, protein: 20.0, carbohydrates: 35.0, fat: 14.0),
    NutritionData(name: "Pesto Pasta with Cherry Tomatoes", calories: 380.0, protein: 15.0, carbohydrates: 45.0, fat: 16.0),
    NutritionData(name: "Pork Tenderloin with Apple Compote", calories: 400.0, protein: 28.0, carbohydrates: 30.0, fat: 18.0),
    NutritionData(name: "Pumpkin Risotto", calories: 380.0, protein: 15.0, carbohydrates: 45.0, fat: 16.0),
    NutritionData(name: "Quinoa and Black Bean Bowl", calories: 380.0, protein: 18.0, carbohydrates: 40.0, fat: 16.0),
    NutritionData(name: "Salmon and Asparagus", calories: 400.0, protein: 30.0, carbohydrates: 20.0, fat: 22.0),
    NutritionData(name: "Sesame Ginger Tofu", calories: 320.0, protein: 18.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "Shrimp Scampi", calories: 380.0, protein: 25.0, carbohydrates: 20.0, fat: 22.0),
    NutritionData(name: "Soy Ginger Salmon", calories: 420.0, protein: 30.0, carbohydrates: 25.0, fat: 18.0),
    NutritionData(name: "Spaghetti Carbonara", calories: 450.0, protein: 20.0, carbohydrates: 35.0, fat: 25.0),
    NutritionData(name: "Stuffed Bell Peppers with Turkey", calories: 400.0, protein: 28.0, carbohydrates: 30.0, fat: 18.0),
    NutritionData(name: "Sushi Bowl", calories: 420.0, protein: 30.0, carbohydrates: 25.0, fat: 20.0),
    NutritionData(name: "Sweet Potato and Black Bean Chili", calories: 350.0, protein: 20.0, carbohydrates: 35.0, fat: 16.0),
    NutritionData(name: "Ratatouille", calories: 300.0, protein: 10.0, carbohydrates: 35.0, fat: 18.0),
    NutritionData(name: "Teriyaki Chicken Bowl", calories: 420.0, protein: 28.0, carbohydrates: 35.0, fat: 18.0),
    NutritionData(name: "Teriyaki Salmon", calories: 400.0, protein: 28.0, carbohydrates: 30.0, fat: 18.0),
    NutritionData(name: "Teriyaki Tofu Bowl", calories: 380.0, protein: 18.0, carbohydrates: 40.0, fat: 16.0),
    NutritionData(name: "Tomato Basil Mozzarella Skewers", calories: 250.0, protein: 15.0, carbohydrates: 10.0, fat: 18.0),
    NutritionData(name: "Tomato Basil Pasta", calories: 350.0, protein: 15.0, carbohydrates: 40.0, fat: 16.0),
    NutritionData(name: "Turkey and Quinoa Stuffed Bell Peppers", calories: 350.0, protein: 25.0, carbohydrates: 30.0, fat: 14.0),
    NutritionData(name: "Vegan Chickpea Curry", calories: 300.0, protein: 15.0, carbohydrates: 40.0, fat: 12.0),
    NutritionData(name: "Vegetable Pad Thai", calories: 380.0, protein: 18.0, carbohydrates: 40.0, fat: 16.0),
    NutritionData(name: "Vegetarian Tofu Stir-Fry", calories: 350.0, protein: 20.0, carbohydrates: 30.0, fat: 15.0),
    NutritionData(name: "Veggie Burger with Sweet Potato Fries", calories: 350.0, protein: 18.0, carbohydrates: 40.0, fat: 14.0),
  ];

  static List<NutritionData> ingredients = [
    NutritionData(name: "Basil", calories: 22.0, protein: 3.2, carbohydrates: 2.7, fat: 0.6),
    NutritionData(name: "Black Pepper", calories: 255.0, protein: 10.4, carbohydrates: 63.9, fat: 3.3),
    NutritionData(name: "Broccoli", calories: 55.0, protein: 3.7, carbohydrates: 11.2, fat: 0.6),
    NutritionData(name: "Cayenne Pepper", calories: 318.0, protein: 12.0, carbohydrates: 58.0, fat: 17.0),
    NutritionData(name: "Cayenne Powder", calories: 318.0, protein: 12.0, carbohydrates: 58.0, fat: 17.0),
    NutritionData(name: "Chili Powder", calories: 282.0, protein: 15.0, carbohydrates: 56.0, fat: 15.0),
    NutritionData(name: "Chives", calories: 30.0, protein: 3.3, carbohydrates: 4.4, fat: 0.6),
    NutritionData(name: "Cilantro", calories: 23.0, protein: 2.1, carbohydrates: 3.7, fat: 0.5),
    NutritionData(name: "Cinnamon", calories: 247.0, protein: 3.9, carbohydrates: 80.6, fat: 1.2),
    NutritionData(name: "Cinnamon Powder", calories: 247.0, protein: 3.9, carbohydrates: 80.6, fat: 1.2),
    NutritionData(name: "Coconut Oil", calories: 862.0, protein: 0.0, carbohydrates: 0.0, fat: 100.0),
    NutritionData(name: "Coriander", calories: 23.0, protein: 2.1, carbohydrates: 3.7, fat: 0.5),
    NutritionData(name: "Cumin", calories: 375.0, protein: 18.0, carbohydrates: 44.0, fat: 22.0),
    NutritionData(name: "Cumin Powder", calories: 375.0, protein: 18.0, carbohydrates: 44.0, fat: 22.0),
    NutritionData(name: "Fenugreek", calories: 323.0, protein: 23.0, carbohydrates: 58.0, fat: 6.4),
    NutritionData(name: "Flour", calories: 364.0, protein: 10.3, carbohydrates: 72.8, fat: 1.0),
    NutritionData(name: "Garlic", calories: 4.0, protein: 0.2, carbohydrates: 1.0, fat: 0.1),
    NutritionData(name: "Garlic Powder", calories: 331.0, protein: 16.8, carbohydrates: 72.7, fat: 0.7),
    NutritionData(name: "Ginger", calories: 18.0, protein: 0.9, carbohydrates: 4.3, fat: 0.2),
    NutritionData(name: "Honey", calories: 304.0, protein: 0.3, carbohydrates: 82.0, fat: 0.0),
    NutritionData(name: "Lemon", calories: 17.0, protein: 0.6, carbohydrates: 5.4, fat: 0.2),
    NutritionData(name: "Maple Syrup", calories: 260.0, protein: 0.0, carbohydrates: 67.0, fat: 0.0),
    NutritionData(name: "Mint", calories: 31.0, protein: 3.3, carbohydrates: 5.2, fat: 0.7),
    NutritionData(name: "Mustard Seeds", calories: 508.0, protein: 26.0, carbohydrates: 29.0, fat: 36.0),
    NutritionData(name: "Nutmeg", calories: 525.0, protein: 5.8, carbohydrates: 49.0, fat: 36.0),
    NutritionData(name: "Nutmeg Powder", calories: 525.0, protein: 5.8, carbohydrates: 49.0, fat: 36.0),
    NutritionData(name: "Olive Oil", calories: 884.0, protein: 0.0, carbohydrates: 0.0, fat: 100.0),
    NutritionData(name: "Onion", calories: 44.0, protein: 1.2, carbohydrates: 10.4, fat: 0.1),
    NutritionData(name: "Onion Powder", calories: 341.0, protein: 10.4, carbohydrates: 73.5, fat: 1.0),
    NutritionData(name: "Oregano", calories: 265.0, protein: 9.0, carbohydrates: 64.1, fat: 4.3),
    NutritionData(name: "Paprika", calories: 282.0, protein: 14.0, carbohydrates: 56.0, fat: 15.0),
    NutritionData(name: "Paprika Powder", calories: 282.0, protein: 14.0, carbohydrates: 56.0, fat: 15.0),
    NutritionData(name: "Parsley", calories: 36.0, protein: 2.0, carbohydrates: 6.3, fat: 0.8),
    NutritionData(name: "Rosemary", calories: 131.0, protein: 3.3, carbohydrates: 20.7, fat: 5.9),
    NutritionData(name: "Salt", calories: 0.0, protein: 0.0, carbohydrates: 0.0, fat: 0.0),
    NutritionData(name: "Sesame Oil", calories: 884.0, protein: 0.0, carbohydrates: 0.0, fat: 100.0),
    NutritionData(name: "Soy Sauce", calories: 61.0, protein: 5.4, carbohydrates: 8.1, fat: 0.1),
    NutritionData(name: "Spinach", calories: 23.0, protein: 2.9, carbohydrates: 3.6, fat: 0.4),
    NutritionData(name: "Sugar", calories: 387.0, protein: 0.0, carbohydrates: 99.9, fat: 0.0),
    NutritionData(name: "Thyme", calories: 101.0, protein: 1.2, carbohydrates: 24.5, fat: 0.9),
    NutritionData(name: "Turmeric", calories: 354.0, protein: 7.8, carbohydrates: 64.9, fat: 9.9),
    NutritionData(name: "Turmeric Powder", calories: 354.0, protein: 7.8, carbohydrates: 64.9, fat: 9.9),
    NutritionData(name: "Vanilla Extract", calories: 288.0, protein: 0.1, carbohydrates: 14.0, fat: 0.1),
    NutritionData(name: "Vanilla Extract", calories: 288.0, protein: 0.1, carbohydrates: 14.0, fat: 0.1),
  ];

  static List<NutritionData> search(FoodType foodType, String query) {
    List<NutritionData> searchResults = [];
    switch (foodType) {
      case FoodType.food:
        searchResults.addAll(
          foods.where((food) => food.name.toLowerCase().contains(query.toLowerCase())),
        );
        break;
      case FoodType.meal:
        searchResults.addAll(
          meals.where((meal) => meal.name.toLowerCase().contains(query.toLowerCase())),
        );
        break;
      case FoodType.ingredient:
        searchResults.addAll(
          ingredients.where((ingredient) => ingredient.name.toLowerCase().contains(query.toLowerCase())),
        );
        break;
    }
    return searchResults;
  }

  static List<NutritionData> get(FoodType foodType) {
    List<NutritionData> searchResults = [];
    switch (foodType) {
      case FoodType.food:
        searchResults.addAll(
            foods.where((food) => food.name.toLowerCase().contains(""))
        );
        break;
      case FoodType.meal:
        searchResults.addAll(
            meals.where((meal) => meal.name.toLowerCase().contains(""))
        );
        break;
      case FoodType.ingredient:
        searchResults.addAll(
            ingredients.where((ingredient) => ingredient.name.toLowerCase().contains(""))
        );
        break;
    }
    return searchResults;
  }
}