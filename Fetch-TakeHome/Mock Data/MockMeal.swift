//
//  MockMeal.swift
//  Fetch-TakeHome
//
//  Created by Ruchir on 4/9/23.
//

import Foundation

// Create a mock service that conforms to the APIServiceProtocol
struct MockMealAPIService: MealAPIServiceProtocol {
    func fetchMeals(completion: @escaping ([MealModel]) -> Void) {
        let meals = [
            MealModel(meals: [Meal(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strCategory: "Dessert"), Meal(idMeal: "52768", strMeal: "Apple Frangipan Tart", strCategory: "Entree")])
        ]
        // Call the completion handler with the mock data
        completion(meals)
    }
}
