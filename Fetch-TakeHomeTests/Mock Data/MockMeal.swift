//
//  MockMeal.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/9/23.
//

import Foundation

// Create a mock service that conforms to the APIServiceProtocol
struct MockMealAPIService: MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping (MealModel) -> Void) {
        let meals =
            MealModel(meals: [Meal(idMeal: "52857", strMeal: "Pumpkin Pie"), Meal(idMeal: "52929", strMeal: "Timbits"), Meal(idMeal: "52897", strMeal: "Carrot Cake"), Meal(idMeal: "52768", strMeal: "Apple Frangipan Tart")])
        // Call the completion handler with the mock data
        completion(meals)
    }
}
