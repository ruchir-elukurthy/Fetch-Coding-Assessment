//
//  MockMealDetails.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/9/23.
//

import Foundation

//Create a mock service that conforms to the APIServiceProtocol
struct MockMealDetailsAPIService: MealDetailsAPIServiceProtocol {
    func fetchMealDetails(mealID: String, completion: @escaping (MealDetailsModel) -> Void) {
        let dummyMeal = dummyMeal()
        let mealModel = MealDetailsModel(meals: [dummyMeal])
        completion(mealModel)
    }
}

//A sample meal used for testing
func dummyMeal() -> MealDetails {
    let json = """
        {
            "idMeal": "52855",
            "strMeal": "Banana Pancakes",
            "strInstructions": "In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.",
            "strIngredient1": "Banana",
            "strIngredient2": "Eggs",
            "strIngredient3": "Baking Powder",
            "strIngredient4": "Vanilla Extract",
            "strIngredient5": "Oil",
            "strIngredient6": "Pecan Nuts",
            "strIngredient7": "Raspberries",
            "strMeasure1": "1 large",
            "strMeasure2": "2 medium",
            "strMeasure3": "pinch",
            "strMeasure4": "spinkling",
            "strMeasure5": "1 tsp",
            "strMeasure6": "25g",
            "strMeasure7": "125g"
        }
        """

    let dummyData = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    let meal = try! decoder.decode(MealDetails.self, from: dummyData)
    return meal
}
